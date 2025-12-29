/**
 * Wit.ai Speech-to-Text API - Single File
 * POST /api/transcribe
 */

const WIT_TOKEN = 'RHPTZF7H4VEAQWREEYYNJG32DXYFQJRY'; // <-- Put your token here

export const config = {
    api: {
        bodyParser: false
    }
};

async function getRawBody(req) {
    const chunks = [];
    for await (const chunk of req) {
        chunks.push(chunk);
    }
    return Buffer.concat(chunks);
}

export default async function handler(req, res) {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
    res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

    if (req.method === 'OPTIONS') return res.status(200).end();
    if (req.method !== 'POST') return res.status(405).json({ error: 'POST only' });

    try {
        const rawBody = await getRawBody(req);
        let audioBuffer, contentType = 'audio/wav';

        if (req.headers['content-type']?.includes('application/json')) {
            const json = JSON.parse(rawBody.toString());
            if (!json.audio) return res.status(400).json({ error: 'Missing audio (base64)' });
            audioBuffer = Buffer.from(json.audio, 'base64');
            contentType = json.format || 'audio/wav';
        } else {
            audioBuffer = rawBody;
            contentType = req.headers['content-type'] || 'audio/wav';
        }

        if (!audioBuffer || audioBuffer.length === 0) {
            return res.status(400).json({ error: 'Empty audio data' });
        }

        const witRes = await fetch('https://api.wit.ai/speech', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${WIT_TOKEN}`,
                'Content-Type': contentType
            },
            body: audioBuffer
        });

        const responseText = await witRes.text();

        if (!witRes.ok) {
            return res.status(witRes.status).json({ error: responseText });
        }

        // Parse all chunks from wit.ai response
        const chunks = responseText
            .split('\n')
            .filter(l => l.trim())
            .map(l => { try { return JSON.parse(l); } catch { return null; } })
            .filter(Boolean);

        // Find the final result with text
        const final = chunks.reverse().find(c => c.text !== undefined);

        return res.status(200).json({
            success: true,
            text: final?.text || '',
            intents: final?.intents || [],
            entities: final?.entities || {},
            debug: {
                audioSize: audioBuffer.length,
                contentType: contentType,
                witRawResponse: responseText,
                parsedChunks: chunks.length
            }
        });

    } catch (err) {
        return res.status(500).json({ error: err.message });
    }
}
