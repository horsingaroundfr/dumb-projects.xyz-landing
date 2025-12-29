/**
 * Wit.ai Speech-to-Text API - Single File
 * POST /api/transcribe
 */

const WIT_TOKEN = 'RHPTZF7H4VEAQWREEYYNJG32DXYFQJRY'; // <-- Put your token here

export const config = {
    api: { bodyParser: { sizeLimit: '10mb' } }
};

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') return res.status(200).end();
    if (req.method !== 'POST') return res.status(405).json({ error: 'POST only' });

    try {
        let audioBuffer, contentType = 'audio/wav';

        if (req.headers['content-type']?.includes('application/json')) {
            const { audio, format } = req.body;
            if (!audio) return res.status(400).json({ error: 'Missing audio (base64)' });
            audioBuffer = Buffer.from(audio, 'base64');
            contentType = format || 'audio/wav';
        } else {
            audioBuffer = Buffer.from(req.body);
            contentType = req.headers['content-type'] || 'audio/wav';
        }

        const witRes = await fetch('https://api.wit.ai/speech', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${WIT_TOKEN}`,
                'Content-Type': contentType
            },
            body: audioBuffer
        });

        if (!witRes.ok) {
            return res.status(witRes.status).json({ error: await witRes.text() });
        }

        const chunks = (await witRes.text())
            .split('\n')
            .filter(l => l.trim())
            .map(l => { try { return JSON.parse(l); } catch { return null; } })
            .filter(Boolean);

        const final = chunks.reverse().find(c => c.text !== undefined);

        return res.status(200).json({
            success: true,
            text: final?.text || '',
            intents: final?.intents || [],
            entities: final?.entities || {}
        });

    } catch (err) {
        return res.status(500).json({ error: err.message });
    }
}
