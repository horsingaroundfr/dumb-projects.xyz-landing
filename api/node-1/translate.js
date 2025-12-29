/**
 * Translation API - Google Translate (unofficial)
 * POST /api/translate
 * 
 * Uses Google Translate's free web endpoint
 */

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

        // Google Translate unofficial API endpoint
        const url = `https://translate.googleapis.com/translate_a/single?client=gtx&sl=${from}&tl=${to}&dt=t&q=${encodeURIComponent(text)}`;

        const response = await fetch(url, {
            headers: {
                'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
            }
        });

        if (!response.ok) {
            return res.status(response.status).json({ error: 'Translation failed' });
        }

        const data = await response.json();

        // Response format: [[["translated","original",null,null,10]],null,"en",...]
        // data[0] contains translation segments, data[2] is detected source language
        let translated = '';
        if (data[0]) {
            for (const segment of data[0]) {
                if (segment[0]) {
                    translated += segment[0];
                }
            }
        }

        const detectedFrom = data[2] || from;

        return res.status(200).json({
            success: true,
            original: text,
            translated: translated,
            from: detectedFrom,
            to: to
        });

    } catch (err) {
        return res.status(500).json({ error: err.message });
    }
}
