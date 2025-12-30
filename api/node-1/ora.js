const GROQ_KEY = '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';

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
    try {
        // Handle CORS
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.setHeader('Access-Control-Allow-Methods', 'POST, OPTIONS, GET');
        res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

        if (req.method === 'OPTIONS') return res.status(200).end();

        // Handle Web Interface
        if (req.method === 'GET' || (req.query && req.query.web === 'true')) {
            res.setHeader('Content-Type', 'text/html');
            return res.status(200).send(`<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ORA AI</title>
    <style>
        :root { --bg: #0a0a0a; --accent: #00ff88; --text: #e0e0e0; --panel: #141414; }
        body { margin: 0; padding: 0; background: var(--bg); color: var(--text); font-family: 'Inter', sans-serif; height: 100vh; display: flex; flex-direction: column; overflow: hidden; }
        header { padding: 1rem 2rem; border-bottom: 1px solid #333; display: flex; justify-content: space-between; align-items: center; background: rgba(0,0,0,0.5); backdrop-filter: blur(10px); }
        h1 { margin: 0; font-size: 1.2rem; letter-spacing: -0.5px; display: flex; align-items: center; gap: 10px; }
        .badge { background: var(--accent); color: black; padding: 2px 8px; border-radius: 4px; font-size: 0.7rem; font-weight: bold; }
        main { flex: 1; display: flex; padding: 1rem; gap: 1rem; }
        .editor-container { flex: 1; display: flex; flex-direction: column; background: var(--panel); border-radius: 8px; border: 1px solid #333; overflow: hidden; }
        .header-bar { padding: 0.5rem 1rem; background: #222; border-bottom: 1px solid #333; font-size: 0.8rem; color: #888; display: flex; justify-content: space-between; align-items: center; }
        textarea { flex: 1; background: transparent; border: none; padding: 1rem; color: #fff; font-family: monospace; font-size: 0.9rem; resize: none; outline: none; line-height: 1.5; }
        button { background: var(--accent); color: #000; border: none; padding: 0.5rem 1.5rem; font-weight: bold; cursor: pointer; transition: opacity 0.2s; border-radius: 4px; }
        button:hover { opacity: 0.9; }
        button:disabled { opacity: 0.5; cursor: not-allowed; }
        .status { font-size: 0.8rem; color: #666; }
    </style>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <h1>ORA AI <span class="badge">BETA</span></h1>
        <div class="status" id="status">Ready</div>
    </header>
    <main>
        <div class="editor-container">
            <div class="header-bar">INPUT</div>
            <textarea id="input" placeholder="Paste Lua code..."></textarea>
        </div>
        <div class="editor-container">
            <div class="header-bar">
                OUTPUT
                <button onclick="run()" id="btn">PRETTIFY</button>
            </div>
            <textarea id="output" readonly placeholder="Wait..."></textarea>
        </div>
    </main>
    <script>
        async function run() {
            const input = document.getElementById('input').value;
            const btn = document.getElementById('btn');
            const status = document.getElementById('status');
            const out = document.getElementById('output');
            
            if (!input.trim()) return;
            btn.disabled = true;
            status.textContent = 'Processing...';
            out.value = '';

            try {
                const startTime = performance.now();
                // Determine API URL (handle standard Vercel structure vs direct file access)
                const apiUrl = window.location.pathname.endsWith('ora.js') ? window.location.pathname : '/api/node-1/ora';
                
                const res = await fetch(apiUrl, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json' },
                    body: JSON.stringify({ messages: [{ role: 'user', content: input }] })
                });

                if (!res.ok) throw new Error(await res.text());
                const data = await res.json();
                let content = data.choices ? data.choices[0].message.content : (data.content || JSON.stringify(data));
                
                // Simple cleanup of markdown blocks using basic string manipulation to avoid regex escaping hell
                if (content.startsWith('```lua')) content = content.substring(6);
                if (content.startsWith('```')) content = content.substring(3);
            if (content.endsWith('```')) content = content.substring(0, content.length - 3);
            content = content.trim();

            out.value = content;

            const processTime = ((performance.now() - startTime) / 1000).toFixed(2);

            try {
                await navigator.clipboard.writeText(content);
                status.textContent = `Done (${processTime}s) & Copied!`;
            } catch (clipboardErr) {
                console.error(clipboardErr);
                status.textContent = `Done (${processTime}s) (Copy failed)`;
            }

        } catch (e) {
            out.value = 'Error: ' + e.message;
            status.textContent = 'Error';
        } finally {
            btn.disabled = false;
        }
    }
    </script >
</body >
</html > `);
        }

        if (req.method !== 'POST') return res.status(405).json({ error: 'POST only' });

        const rawBody = await getRawBody(req);
        let content = '';
        try {
            const json = JSON.parse(rawBody.toString());
            content = json.messages ? json.messages.find(m => m.role === 'user').content : (json.code || json.content || rawBody.toString());
        } catch {
            content = rawBody.toString();
        }

        const response = await fetch('https://api.groq.com/openai/v1/chat/completions', {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${ GROQ_KEY } `,
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                model: 'groq/compound',
                messages: [
                    {
                        role: "system",
                        content: "You are ORA AI, a strict code-only Lua prettifier engine. OUTPUT RULES: 1. Output ONLY valid, runnable Lua code. 2. DO NOT output any markdown formatting, code fences, or explanations. 3. DO NOT output comments. 4. Functionality must be a 1:1 replica of the user's input, just readable. 5. Any text that is not Lua code is strictly FORBIDDEN. If you feel the need to explain, DON'T. Just code."
                    },
                    {
                        role: "user",
                        content: content
                    }
                ],
                temperature: 0.1,
                max_completion_tokens: 1024,
                top_p: 1,
                stream: false
            })
        });

        const data = await response.json();

        // Server-side safeguarding: Sanitize rate limit errors
        if (response.status === 429 || (data.error && data.error.code === 'rate_limit_exceeded')) {
            let errorMsg = 'Error, Try again later';
            if (data.error && data.error.message) {
                const match = data.error.message.match(/Please try again in (\d+(\.\d+)?)s/);
                if (match) {
                    errorMsg += ` (${ match[0]})`;
                }
            }
            return res.status(429).send(errorMsg);
        }

        return res.status(response.status).json(data);

    } catch (err) {
        console.error(err);
        return res.status(500).json({ error: err.message, stack: err.stack });
    }
}
