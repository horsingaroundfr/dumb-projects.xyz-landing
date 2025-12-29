/**
 * Translation API - Free, no API key needed
 * POST /api/translate
 * 
 * Uses MyMemory (free tier: 5000 chars/day)
 * For more: add email param for 10k/day, or use DeepL free API
 */

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'POST, GET, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') return res.status(200).end();

    try {
        // Accept both GET and POST
        const { text, from = 'auto', to = 'en' } = req.method === 'GET' ? req.query : req.body;

        if (!text) {
            return res.status(400).json({ error: 'Missing "text" parameter' });
        }

        // Language pair format: en|es, auto|fr, etc.
        const langpair = `${from}|${to}`;

        const url = `https://api.mymemory.translated.net/get?q=${encodeURIComponent(text)}&langpair=${langpair}`;

        const response = await fetch(url);
        const data = await response.json();

        if (data.responseStatus !== 200) {
            return res.status(400).json({
                error: data.responseDetails || 'Translation failed',
                status: data.responseStatus
            });
        }

        return res.status(200).json({
            success: true,
            original: text,
            translated: data.responseData.translatedText,
            from: from,
            to: to,
            confidence: data.responseData.match
        });

    } catch (err) {
        return res.status(500).json({ error: err.message });
    }
}
