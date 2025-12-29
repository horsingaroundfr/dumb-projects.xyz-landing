/**
 * Translation API - Free with auto-detect
 * POST /api/translate
 * 
 * Uses LibreTranslate (free public instance)
 */

const LIBRETRANSLATE_URL = 'https://libretranslate.com';

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') return res.status(200).end();

    try {
        const { text, from = 'auto', to = 'en' } = req.method === 'GET' ? req.query : req.body;

        if (!text) {
            return res.status(400).json({ error: 'Missing "text" parameter' });
        }

        // Detect language first if auto
        let sourceLanguage = from;
        if (from === 'auto') {
            const detectRes = await fetch(`${LIBRETRANSLATE_URL}/detect`, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ q: text })
            });
            const detectData = await detectRes.json();

            if (detectData && detectData[0]) {
                sourceLanguage = detectData[0].language;
            } else {
                sourceLanguage = 'en'; // fallback
            }
        }

        // Translate
        const translateRes = await fetch(`${LIBRETRANSLATE_URL}/translate`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({
                q: text,
                source: sourceLanguage,
                target: to
            })
        });

        const data = await translateRes.json();

        if (data.error) {
            return res.status(400).json({ error: data.error });
        }

        return res.status(200).json({
            success: true,
            original: text,
            translated: data.translatedText,
            from: sourceLanguage,
            to: to
        });

    } catch (err) {
        return res.status(500).json({ error: err.message });
    }
}
