require('dotenv').config(); // support .env
const { default: makeWASocket, useMultiFileAuthState, DisconnectReason, fetchLatestBaileysVersion } = require('baileys');
const { sendButtons } = require('@ryuu-reinzz/button-helper');
const qrcode = require('qrcode-terminal');
const axios = require('axios');
const fs = require('fs');

// --- KONFIGURASI ---
const toxicWords = [
    'anjing', 'babi', 'monyet', 'kunyuk', 'asu', 'celeng', 'bajing', 'landak', 'garangan', 'anying', 'jing', 'kanjut', 'pantek', 'puki', 'pukas', 'toket', 'tobrut', 'tembolok', 'asoe', 'andjing',
    'goblok', 'tolol', 'bego', 'idiot', 'cacat', 'sinting', 'gila', 'autis', 'bloon', 'yatim', 'nigga', 'negro', 'beloon', 'dongo', 'dungu', 'geblek', 'dongok', 'coli', 'peli', 'janco', 'ongok',
    'peler', 'memek', 'kontol', 'jembut', 'itil', 'ngentot', 'ngewe', 'tempik', 'titit', 'pepek', 'cukimai', 'entot', 'kampang', 'menyodok', 'merodok', 'modar', 'monyong', 'sialan', 'taruk', 'gendut',
    'bangsat', 'keparat', 'brengsek', 'lonte', 'perek', 'jablay', 'bajingan', 'pelacur', 'pendoza', 'ewe', 'koit', 'kojor', 'memberaki', 'mengamput', 'mengancuk', 'mengayut', 'mengentot', 'kampret',
    'taik', 'tai', 'bangke', 'bangkae', 'jancok', 'jancuk', 'ancuk', 'ancok', 'cok', 'cuk', 'bgst', 'fuck', 'shit', 'bitch', 'asshole', 'dick', 'pussy', 'cunt', 'motherfucker', 'bastard', 'abus',
    'anj', 'ajg', 'anjg', 'mnyet', 'ppk', 'kntl', 'mmk', 'pukimak', 'telang', 'lasso', 'dodol', 'bengak', 'pilat', 'gathel', 'gegares', 'geladak', 'beal', 'gelayaran', 'mampus', 'bacot', 'cungur'
];
const pythonUrl = process.env.PYTHON_URL || 'http://127.0.0.1:8000';

// --- CHAT HISTORY ---
const historyFile = 'chat_history.json';
function loadHistory() {
    if (fs.existsSync(historyFile)) {
        try {
            if (fs.statSync(historyFile).isDirectory()) {
                console.error(`Error: '${historyFile}' is a directory, not a file. Chat history will not be loaded or saved until this is manually resolved.`);
                return [];
            }
            const data = fs.readFileSync(historyFile, 'utf8');
            if (!data) return []; // Handle empty file
            return JSON.parse(data);
        } catch (e) {
            console.log(`Warning: Could not read or parse '${historyFile}'. A new one will be created. Error: ${e.message}`);
            return [];
        }
    }
    return [];
}
function saveHistory(history) {
    try {
        if (fs.existsSync(historyFile) && fs.statSync(historyFile).isDirectory()) {
            return;
        }
        fs.writeFileSync(historyFile, JSON.stringify(history, null, 2));
    } catch (e) {
        console.error(`Error saving chat history: ${e.message}`);
    }
}
let chatHistory = loadHistory();

// IP & Port Bridge (default: 127.0.0.1:9000)
const bridgeHost = process.env.BRIDGE_HOST || '127.0.0.1';
const bridgePort = process.env.BRIDGE_PORT || '9000';

let quizData = {};
let nextRequests = {};

function normalizeText(str) {
    return str.toLowerCase()
        .replace(/0/g, 'o').replace(/1/g, 'i').replace(/3/g, 'e')
        .replace(/4/g, 'a').replace(/5/g, 's').replace(/7/g, 'j')
        .replace(/8/g, 'b').replace(/[^a-z0-9\s]/g, '');
}

async function connectWA() {
    console.log("⏳ Starting connection in 5 seconds to wait for network...");
    await new Promise(resolve => setTimeout(resolve, 5000));

    const { state, saveCreds } = await useMultiFileAuthState(process.env.SESSION_NAME || 'auth_info');

    let version, isLatest;
    try {
        const v = await fetchLatestBaileysVersion();
        version = v.version;
        isLatest = v.isLatest;
    } catch (e) {
        console.log("⚠️ Could not fetch latest WA version, using default.");
        version = [2, 3000, 1015901307]; // Fallback version
        isLatest = false;
    }

    console.log(`using WA v${version.join('.')}, isLatest: ${isLatest}`);

    const sock = makeWASocket({
        version,
        auth: state,
        browser: ["Ubuntu", "Chrome", "121.0.6167.85"],
        logger: require('pino')({ level: 'error' }), // Only log errors
        connectTimeoutMs: 60000,
        defaultQueryTimeoutMs: 0,
        keepAliveIntervalMs: 10000,
        generateHighQualityLinkPreview: true,
        getMessage: async (key) => {
            return { conversation: 'Belinda AI is active' };
        }
    });

    sock.ev.on('creds.update', saveCreds);

    sock.ev.on('connection.update', (update) => {
        const { connection, qr, lastDisconnect } = update;
        if (qr) {
            console.log("📸 New QR Code generated. Please scan:");
            qrcode.generate(qr, { small: true });
        }
        if (connection === 'open') {
            console.log(`✅ BOT BELINDA ONLINE (Bridge: ${bridgeHost}:${bridgePort})`);
        }
        if (connection === 'close') {
            const reason = lastDisconnect?.error?.output?.statusCode || 0;
            const shouldReconnect = (
                reason !== DisconnectReason.loggedOut &&
                reason !== DisconnectReason.badSession &&
                reason !== DisconnectReason.connectionReplaced
            );

            console.log(`❌ Connection closed. Reason code: ${reason}. Reconnecting: ${shouldReconnect}`);

            if (reason === DisconnectReason.loggedOut || reason === DisconnectReason.badSession) {
                console.log("⚠️ Session is invalid or logged out. Please delete the session folder and scan again.");
            } else if (reason === DisconnectReason.connectionReplaced) {
                console.log("⚠️ Connection replaced by another session. Stopping current bridge.");
            } else if (reason === 408 || reason === 503) {
                console.log("⚠️ Server error or timeout. Retrying in 20s...");
                if (shouldReconnect) setTimeout(connectWA, 20000);
            } else if (shouldReconnect) {
                const delay = 10000;
                console.log(`⏳ Reconnecting in ${delay / 1000}s...`);
                setTimeout(connectWA, delay);
            }
        }
    });

    // --- WELCOME MESSAGE ---
    sock.ev.on('group-participants.update', async (anu) => {
        if (anu.action === 'add') {
            try {
                await new Promise(resolve => setTimeout(resolve, 1500));
                const metadata = await sock.groupMetadata(anu.id);
                for (let participant of anu.participants) {
                    const jid = typeof participant === 'string' ? participant : participant.id;
                    const mentionJid = jid.split('@')[0];
                    const welcomeText = `👋 *Halo @${mentionJid}!*\n\nSelamat datang di grup *${metadata.subject}*.\n\nSemoga betah di sini ya!`;
                    await sock.sendMessage(anu.id, { text: welcomeText, mentions: [jid] });
                }
            } catch (e) { console.log("Error Welcome Message:", e.message); }
        }
    });

    // --- FUNGSI CREATE QUIZ ---
    async function createQuiz(group) {
        const data = quizData[group];
        if (data.currentNum >= data.maxSoal) {
            const content = {
                text: `🏁 *QUIZ SELESAI!*\n\nBerhasil menyelesaikan ${data.maxSoal} soal *${data.mapel.toUpperCase()}* (${data.diff.toUpperCase()}).\n\n_Pilih opsi di bawah untuk lanjut atau berhenti._`,
                footer: "🤖 Belinda AI Quiz",
                buttons: [
                    { id: '!quiz', text: '🔄 Ulangi Quiz' }
                ]
            };

            try {
                await sendButtons(sock, group, content);
            } catch (e) {
                console.error("Gagal mengirim tombol:", e);
                await sock.sendMessage(group, { text: content.text + "\n\n1. !quiz" });
            }
            delete quizData[group];
            return;
        }

        data.currentNum++;
        await sock.sendMessage(group, { text: `⏳ Menyiapkan soal ke-${data.currentNum}/${data.maxSoal}...` });

        try {
            const prompt = `Buatkan 1 soal PG (Pilihan Ganda) ${data.mapel} untuk tingkat ${data.diff} (A-E). ` +
                `Pastikan soalnya variatif, menantang, and berbeda dari topik umum. ` +
                `Berikan pilihan jawaban A sampai E. Tulis 'KUNCI: X' di akhir soal. [Seed: ${Math.random().toString(36).substring(7)}]`;

            const res = await axios.post(`${pythonUrl}/chat`, { sender: group, msg: prompt });

            const parts = res.data.split('KUNCI:');
            const cleanText = parts[0].trim();
            const keyChar = parts[1]?.trim()[0].toUpperCase();

            const poll = await sock.sendMessage(group, {
                poll: {
                    name: `*SOAL ${data.currentNum}/${data.maxSoal}* (${data.mapel.toUpperCase()} - ${data.diff.toUpperCase()})\n\n${cleanText}`,
                    values: ['A', 'B', 'C', 'D', 'E'],
                    selectableCount: 1
                }
            });

            data.msgId = poll.key.id;
            data.question = cleanText;
            data.index = ['A', 'B', 'C', 'D', 'E'].indexOf(keyChar);
            nextRequests[group] = [];
        } catch (e) {
            data.currentNum--;
            console.log("Gagal membuat kuis:", e.message);
        }
    }

    // --- MESSAGE HANDLER ---
    sock.ev.on('messages.upsert', async ({ messages }) => {
        const m = messages[0];
        if (!m.message || m.key.fromMe) return;

        const sender = m.key.remoteJid;

        const buttonText = m.message.buttonsResponseMessage?.selectedDisplayText || m.message.templateButtonReplyMessage?.selectedDisplayText || "";
        const buttonId = m.message.buttonsResponseMessage?.selectedButtonId || m.message.templateButtonReplyMessage?.selectedId || "";
        const interactiveResponse = m.message.interactiveResponseMessage?.nativeFlowResponseMessage?.paramsJson;
        let interactiveId = "";
        if (interactiveResponse) {
            try {
                const parsed = JSON.parse(interactiveResponse);
                interactiveId = parsed.id;
            } catch (e) { }
        }

        const text_orig = (m.message.conversation || m.message.extendedTextMessage?.text || "").trim();
        const text = (interactiveId || buttonId || buttonText || text_orig).trim();

        const isGroup = sender.endsWith('@g.us');
        const participant = m.key.participant || sender;

        async function isAdmin() {
            if (!isGroup) return true;
            const meta = await sock.groupMetadata(sender);
            return meta.participants.filter(p => p.admin).map(p => p.id).includes(participant);
        }

        // --- ANTI-TOXIC ---
        if (isGroup && text) {
            const cleanText = normalizeText(text);
            const words = cleanText.split(/\s+/);
            if (words.some(w => toxicWords.includes(w))) {
                try { await sock.sendMessage(sender, { delete: m.key }); return; } catch (e) { }
            }
        }

        // --- CHAT HISTORY ---
        if (text && !text.startsWith('!')) {
            chatHistory.push({ sender, participant, text, time: new Date().toISOString() });
            saveHistory(chatHistory);
        }

        // --- COMMANDS ---
        if (text.startsWith('!')) {
            const args = text.split(' ');
            const cmd = args[0].toLowerCase();

            if (cmd === '!kick') {
                if (!(await isAdmin())) return sock.sendMessage(sender, { text: "❌ Only admins can use this." });
                const target = args[1]?.replace('@', '').replace(/[^0-9]/g, '') + '@s.whatsapp.net';
                try {
                    await sock.groupParticipantsUpdate(sender, [target], 'remove');
                    await sock.sendMessage(sender, { text: `👢 Removed ${args[1]} from the group.` });
                } catch (e) { sock.sendMessage(sender, { text: "⚠️ Failed to remove member." }); }
                return;
            }

            if (cmd === '!cuaca') {
                const city = args.slice(1).join(' ');
                if (!city) return sock.sendMessage(sender, { text: "⚠️ Format: !cuaca {nama_kota}" });

                try {
                    const res = await axios.post(`${pythonUrl}/weather`, { msg: city });
                    await sock.sendMessage(sender, { text: res.data });
                } catch (e) {
                    await sock.sendMessage(sender, { text: `❌ Error: ${e.message}` });
                }
                return;
            }

            if (cmd === '!cuaca') {
                const city = args.slice(1).join(' ');
                if (!city) return sock.sendMessage(sender, { text: "⚠️ Format: !cuaca {nama_kota}" });

                try {
                    const res = await axios.post(`${pythonUrl}/weather`, { msg: city });
                    await sock.sendMessage(sender, { text: res.data });
                } catch (e) {
                    await sock.sendMessage(sender, { text: `❌ Error: ${e.message}` });
                }
                return;
            }

            if (cmd === '!add') {
                if (!(await isAdmin())) return sock.sendMessage(sender, { text: "❌ Only admins can use this." });
                if (!args[1]) return sock.sendMessage(sender, { text: "⚠️ Format: !add {nomor} (Contoh: !add 628xxx atau !add 1234xxx)" });

                let num = args[1].replace(/[^0-9]/g, '');
                if (num.startsWith('0')) {
                    num = '62' + num.substring(1);
                }
                const target = num + '@s.whatsapp.net';

                try {
                    const response = await sock.groupParticipantsUpdate(sender, [target], 'add');
                    const result = response[0];

                    if (result.status === "200") {
                        await sock.sendMessage(sender, { text: `✅ Berhasil menambahkan @${num} ke grup.`, mentions: [target] });
                    } else if (result.status === "403") {
                        const code = await sock.groupInviteCode(sender);
                        const inviteLink = `https://chat.whatsapp.com/${code}`;
                        await sock.sendMessage(sender, {
                            text: `⚠️ Tidak bisa menambahkan @${num} secara langsung karena pengaturan privasi mereka.\n\n*Solusi:* Silakan kirimkan link undangan ini ke mereka:\n${inviteLink}`,
                            mentions: [target]
                        });
                    } else if (result.status === "408") {
                        await sock.sendMessage(sender, { text: `❌ Nomor @${num} baru saja keluar dari grup. Tunggu beberapa saat.`, mentions: [target] });
                    } else if (result.status === "409") {
                        await sock.sendMessage(sender, { text: `ℹ️ Nomor @${num} sudah ada di dalam grup.`, mentions: [target] });
                    } else {
                        await sock.sendMessage(sender, { text: `❌ Gagal menambahkan. Status: ${result.status}` });
                    }
                } catch (e) {
                    console.error("Add error:", e);
                    sock.sendMessage(sender, { text: "⚠️ Pastikan bot adalah Admin dan nomor valid dengan kode negara." });
                }
                return;
            }

            if (cmd === '!open') {
                if (!(await isAdmin())) return sock.sendMessage(sender, { text: "❌ Only admins can use this." });
                await sock.groupSettingUpdate(sender, 'not_announcement');
                await sock.sendMessage(sender, { text: "🔓 Group is now open for all members." });
                return;
            }

            if (cmd === '!close') {
                if (!(await isAdmin())) return sock.sendMessage(sender, { text: "❌ Only admins can use this." });
                await sock.groupSettingUpdate(sender, 'announcement');
                await sock.sendMessage(sender, { text: "🔒 Group is now restricted to admins only." });
                return;
            }

            if (cmd === '!zero') {
                if (!(await isAdmin())) return sock.sendMessage(sender, { text: "❌ Only admins can use this." });
                chatHistory = [];
                saveHistory(chatHistory);
                await sock.sendMessage(sender, { text: "🧹 Chat history cleared." });
                return;
            }

            if (cmd === '!log') {
                if (chatHistory.length === 0) return sock.sendMessage(sender, { text: "📭 No chat history available." });
                const logs = chatHistory.map(h => `${h.time} | ${h.participant}: ${h.text}`).join('\n');
                await sock.sendMessage(sender, { text: `📝 Chat Log:\n\n${logs.slice(-4000)}` });
                return;
            }

            if (cmd === '!shell') {
                const command = args.slice(1).join(' ');
                if (!command) return sock.sendMessage(sender, { text: "⚠️ Please provide a command." });
                if (!(await isAdmin())) return sock.sendMessage(sender, { text: "❌ Only admins can use !shell." });

                const { key } = await sock.sendMessage(sender, { text: "⏳ Executing shell..." });
                let output = "";
                let lastUpdate = Date.now();

                try {
                    const response = await axios({
                        method: 'post',
                        url: `${pythonUrl}/shell`,
                        data: { msg: command },
                        responseType: 'stream'
                    });

                    response.data.on('data', async (chunk) => {
                        output += chunk.toString();
                        if (Date.now() - lastUpdate > 3000) {
                            try {
                                await sock.sendMessage(sender, { text: "```\n" + output.slice(-4000) + "\n```", edit: key });
                                lastUpdate = Date.now();
                            } catch (err) {
                                console.error("Rate limit or edit error in shell:", err.message);
                            }
                        }
                    });

                    response.data.on('end', async () => {
                        try {
                            await sock.sendMessage(sender, { text: "```\n" + output.slice(-4000) + "\n```", edit: key });
                        } catch (err) {
                            console.error("Final shell update error:", err.message);
                        }
                    });
                } catch (e) {
                    try {
                        await sock.sendMessage(sender, { text: `❌ Error: ${e.message}`, edit: key });
                    } catch (err) { }
                }
                return;
            }

            if (cmd === '!music') {
                const url = args[1];
                if (!url) return sock.sendMessage(sender, { text: "⚠️ Please provide a Spotify or YouTube link." });

                const isSpotify = url.includes('spotify.com');
                const isYouTube = url.includes('youtube.com') || url.includes('youtu.be');

                if (!isSpotify && !isYouTube) {
                    return sock.sendMessage(sender, { text: "❌ Only Spotify or YouTube links are supported for music." });
                }

                const { key } = await sock.sendMessage(sender, { text: `⏳ Processing ${isSpotify ? 'Spotify' : 'YouTube'} music...` });

                const fileNameBase = `music_${Date.now()}`;
                const { spawn } = require('child_process');
                const path = require('path');

                let searchQuery = url;
                if (isSpotify) {
                    try {
                        const response = await axios.get(url, { headers: { 'User-Agent': 'Mozilla/5.0' } });
                        const matchTitle = response.data.match(/<title>(.*?)<\/title>/);
                        if (matchTitle && matchTitle[1]) {
                            let cleanTitle = matchTitle[1]
                                .replace(/ \| Spotify/g, '')
                                .replace(/song and lyrics by /g, '')
                                .replace(/song by /g, '')
                                .trim();
                            searchQuery = cleanTitle;
                        }
                    } catch (e) {
                        console.error("Spotify fetch error:", e.message);
                    }
                }

                const isWin = process.platform === 'win32';
                const audioFormat = isWin ? 'mp3' : 'opus';
                const audioMime = isWin ? 'audio/mpeg' : 'audio/ogg; codecs=opus';
                const isPtt = !isWin;

                // If it's already a YouTube link, don't use ytsearch1:
                const finalQuery = (isYouTube && !isSpotify) ? url : `ytsearch1:${searchQuery}`;

                const args_dl = [
                    '--print', 'after_move:filepath',
                    '-x', '--audio-format', audioFormat,
                    '--no-playlist', '--no-check-certificate',
                    '-o', `${fileNameBase}.%(ext)s`,
                    finalQuery
                ];

                const ls = spawn('yt-dlp', args_dl);
                let lastUpdate = Date.now();
                let stderrData = "";
                let stdoutData = "";

                ls.stderr.on('data', (data) => { stderrData += data.toString(); });
                ls.stdout.on('data', (data) => {
                    const output = data.toString();
                    stdoutData += output;
                    const match = output.match(/(\d+\.\d+)%/);
                    if (match && Date.now() - lastUpdate > 4000) {
                        const percent = parseFloat(match[1]);
                        const progress = Math.floor(percent / 10);
                        const bar = '▓'.repeat(progress) + '░'.repeat(10 - progress);
                        sock.sendMessage(sender, { text: `🎵 *Downloading Music (${audioFormat.toUpperCase()})*\n\n[${bar}] ${percent}%\n\n_Sedang memproses pesan suara..._`, edit: key }).catch(() => { });
                        lastUpdate = Date.now();
                    }
                });
                ls.on('close', async (code) => {
                    if (code === 0) {
                        const fullBar = '█'.repeat(20);
                        await sock.sendMessage(sender, { text: `⏳ Processing ${isSpotify ? 'Spotify' : 'YouTube'} music... ✅\n\n🎵 *Downloading Audio*\n\`[${fullBar}] 100.0%\` \n\n_Finishing up, sending to WhatsApp..._`, edit: key }).catch(() => { });
                        await new Promise(resolve => setTimeout(resolve, 2000));
                    } else {
                        return sock.sendMessage(sender, { text: `❌ Failed to download music. (Code ${code})`, edit: key });
                    }
                });

                ls.on('close', async (code) => {
                    const lines = stdoutData.trim().split('\n');
                    const lastLine = lines[lines.length - 1]?.trim();
                    let filePath = lastLine && fs.existsSync(lastLine) ? lastLine : null;

                    if (!filePath) {
                        // Aggressive search: look for any file starting with our base name
                        try {
                            const files = fs.readdirSync(process.cwd());
                            const found = files.find(f => f.startsWith(fileNameBase));
                            if (found) filePath = path.join(process.cwd(), found);
                        } catch (e) { console.error("File search error:", e); }
                    }

                    if (!filePath) {
                        try { await sock.sendMessage(sender, { text: "❌ Error: Could not find downloaded file. Check console.", edit: key }); } catch (e) { }
                        return;
                    }

                    try {
                        try { await sock.sendMessage(sender, { text: `📤 *Sending ${isPtt ? 'voice note' : 'audio'}...*`, edit: key }); } catch (e) { }
                        await sock.sendMessage(sender, { audio: { url: filePath }, mimetype: audioMime, ptt: isPtt });
                        try { await sock.sendMessage(sender, { text: "✅ Music sent!", edit: key }); } catch (e) { }
                        // Use a small timeout before unlinking to ensure WhatsApp has finished processing
                        setTimeout(() => { if (fs.existsSync(filePath)) fs.unlinkSync(filePath); }, 5000);
                    } catch (e) {
                        try { await sock.sendMessage(sender, { text: `❌ Error sending: ${e.message}`, edit: key }); } catch (err) { }
                        if (filePath && fs.existsSync(filePath)) fs.unlinkSync(filePath);
                    }
                });
                return;
            }

            if (cmd === '!video') {
                const url = args[1];
                if (!url) return sock.sendMessage(sender, { text: "⚠️ Please provide a YouTube link." });

                const isYouTube = url.includes('youtube.com') || url.includes('youtu.be');
                if (!isYouTube) {
                    return sock.sendMessage(sender, { text: "❌ Only YouTube links are supported untuk !video. (TikTok, IG, FB tidak didukung)" });
                }

                const { key } = await sock.sendMessage(sender, { text: "⏳ Downloading YouTube video..." });

                const fileNameBase = `video_${Date.now()}`;
                const { spawn } = require('child_process');
                const path = require('path');

                const args_dl = ['--print', 'after_move:filepath', '-f', 'best[height<=480][ext=mp4]/best[ext=mp4]/best', '--no-playlist', '--no-check-certificate', '-o', `${fileNameBase}.%(ext)s`, url];

                const ls = spawn('yt-dlp', args_dl);
                let lastUpdate = Date.now();
                let stderrData = "";
                let stdoutData = "";

                ls.stderr.on('data', (data) => { stderrData += data.toString(); });
                ls.stdout.on('data', (data) => {
                    const output = data.toString();
                    stdoutData += output;
                    const match = output.match(/(\d+\.\d+)%/);
                    if (match && Date.now() - lastUpdate > 4000) {
                        const percent = parseFloat(match[1]);
                        const progress = Math.floor(percent / 10);
                        const bar = '█'.repeat(progress) + '▒'.repeat(10 - progress);
                        sock.sendMessage(sender, { text: `🎬 *Downloading Video*\n\n[${bar}] ${percent}%\n\n_Video sedang diproses..._`, edit: key }).catch(() => { });
                        lastUpdate = Date.now();
                    }
                });

                ls.on('close', async (code) => {
                    if (code !== 0) {
                        console.error("yt-dlp error:", stderrData);
                        try { await sock.sendMessage(sender, { text: `❌ Failed to download video. Error: ${stderrData.slice(-100)}`, edit: key }); } catch (e) { }
                        return;
                    }

                    const lines = stdoutData.trim().split('\n');
                    const lastLine = lines[lines.length - 1]?.trim();
                    let filePath = lastLine && fs.existsSync(lastLine) ? lastLine : null;

                    if (!filePath) {
                        const files = fs.readdirSync(process.cwd());
                        const found = files.find(f => f.startsWith(fileNameBase));
                        filePath = found ? path.join(process.cwd(), found) : null;
                    }

                    if (!filePath) {
                        try { await sock.sendMessage(sender, { text: "❌ Error: Video file not found on disk.", edit: key }); } catch (e) { }
                        return;
                    }

                    try {
                        try { await sock.sendMessage(sender, { text: "📤 *Sending video...*", edit: key }); } catch (e) { }
                        await sock.sendMessage(sender, { video: { url: filePath }, caption: "✅ Video sent!" });
                        try { await sock.sendMessage(sender, { text: "✅ Video sent!", edit: key }); } catch (e) { }
                        fs.unlinkSync(filePath);
                    } catch (e) {
                        try { await sock.sendMessage(sender, { text: `❌ Error: ${e.message}`, edit: key }); } catch (err) { }
                        if (filePath && fs.existsSync(filePath)) fs.unlinkSync(filePath);
                    }
                });
                return;
            }

            if (cmd === '!gen') {
                const format = args[1];
                const prompt = args.slice(2).join(' ');
                if (!format || !prompt) return sock.sendMessage(sender, { text: "⚠️ Format: !gen {type:ext} {prompt}\nContoh: !gen scr:py bot auto chat" });

                const { key } = await sock.sendMessage(sender, { text: `⏳ Generating/Searching ${format}... Please wait.` });

                try {
                    const res = await axios.post(`${pythonUrl}/gen`, { sender, format, msg: prompt });

                    if (typeof res.data === 'string') {
                        await sock.sendMessage(sender, { text: res.data, edit: key });
                    } else if (res.data.type === 'document') {
                        const fileName = res.data.path;
                        let mimetype = 'application/octet-stream';

                        if (format.startsWith('doc:')) {
                            const docFmt = format.split(':')[1];
                            mimetype = 'application/vnd.openxmlformats-officedocument.' + (docFmt === 'ppt' ? 'presentationml.presentation' : docFmt === 'word' ? 'wordprocessingml.document' : 'spreadsheetml.sheet');
                        } else if (format.startsWith('scr:')) {
                            const ext = format.split(':')[1];
                            const mimeMap = {
                                'py': 'text/x-python',
                                'lua': 'text/x-lua',
                                'js': 'application/javascript',
                                'ts': 'application/typescript',
                                'cpp': 'text/x-c++src',
                                'c': 'text/x-csrc',
                                'cs': 'text/x-csharp',
                                'java': 'text/x-java',
                                'go': 'text/x-go',
                                'rs': 'text/x-rustsrc',
                                'php': 'application/x-httpd-php',
                                'rb': 'text/x-ruby',
                                'sh': 'application/x-sh',
                                'sql': 'text/x-sql'
                            };
                            mimetype = mimeMap[ext] || 'application/octet-stream';
                        } else if (format.startsWith('3dm:')) {
                            mimetype = 'application/octet-stream';
                        }

                        await sock.sendMessage(sender, {
                            document: { url: `./${fileName}` },
                            mimetype: mimetype,
                            fileName: fileName,
                            caption: `✅ Successfully generated/fetched ${format.toUpperCase()}`
                        });
                        await sock.sendMessage(sender, { text: `✅ File delivered!`, edit: key }).catch(() => { });
                        fs.unlinkSync(fileName);
                    }
                } catch (e) {
                    await sock.sendMessage(sender, { text: `❌ Error: ${e.message}`, edit: key });
                }
                return;
            }

            if (cmd === '!gen') {
                const format = args[1];
                const prompt = args.slice(2).join(' ');
                if (!format || !prompt) return sock.sendMessage(sender, { text: "⚠️ Format: !gen {type:ext} {prompt}\nContoh: !gen scr:py bot auto chat" });

                const { key } = await sock.sendMessage(sender, { text: `⏳ Generating/Searching ${format}... Please wait.` });

                try {
                    const res = await axios.post(`${pythonUrl}/gen`, { sender, format, msg: prompt });

                    if (typeof res.data === 'string') {
                        await sock.sendMessage(sender, { text: res.data, edit: key });
                    } else if (res.data.type === 'document') {
                        const fileName = res.data.path;
                        let mimetype = 'application/octet-stream';

                        if (format.startsWith('doc:')) {
                            const docFmt = format.split(':')[1];
                            mimetype = 'application/vnd.openxmlformats-officedocument.' + (docFmt === 'ppt' ? 'presentationml.presentation' : docFmt === 'word' ? 'wordprocessingml.document' : 'spreadsheetml.sheet');
                        } else if (format.startsWith('scr:')) {
                            const ext = format.split(':')[1];
                            const mimeMap = {
                                'py': 'text/x-python',
                                'lua': 'text/x-lua',
                                'js': 'application/javascript',
                                'ts': 'application/typescript',
                                'cpp': 'text/x-c++src',
                                'c': 'text/x-csrc',
                                'cs': 'text/x-csharp',
                                'java': 'text/x-java',
                                'go': 'text/x-go',
                                'rs': 'text/x-rustsrc',
                                'php': 'application/x-httpd-php',
                                'rb': 'text/x-ruby',
                                'sh': 'application/x-sh',
                                'sql': 'text/x-sql'
                            };
                            mimetype = mimeMap[ext] || 'application/octet-stream';
                        } else if (format.startsWith('3dm:')) {
                            mimetype = 'application/octet-stream';
                        }

                        await sock.sendMessage(sender, {
                            document: { url: `./${fileName}` },
                            mimetype: mimetype,
                            fileName: fileName,
                            caption: `✅ Successfully generated/fetched ${format.toUpperCase()}`
                        });
                        await sock.sendMessage(sender, { text: `✅ File delivered!`, edit: key }).catch(() => { });
                        fs.unlinkSync(fileName);
                    }
                } catch (e) {
                    await sock.sendMessage(sender, { text: `❌ Error: ${e.message}`, edit: key });
                }
                return;
            }

            if (cmd === '!quran') {
                const query = args[1];
                if (!query || !query.includes(':')) return sock.sendMessage(sender, { text: "⚠️ Format: !quran {surah}:{ayah} (Contoh: !quran 1:1)" });

                const [surah, ayah] = query.split(':');
                try {
                    const url = `https://api.alquran.cloud/v1/ayah/${surah}:${ayah}/editions/quran-uthmani,id.indonesian,en.transliteration`;
                    const response = await axios.get(url);
                    const data = response.data.data;
                    const arab = data[0].text;
                    const arti = data[1].text;
                    const latin = data[2].text;
                    const surahName = data[0].surah.englishName;
                    const result = `\n📖 *Surah ${surahName} (${surah}:${ayah})*\n\n${arab}\n\n_(${latin})_\n\n*Artinya:* ${arti}`;
                    await sock.sendMessage(sender, { text: result });
                } catch (e) {
                    await sock.sendMessage(sender, { text: `❌ Gagal mengambil ayat: ${e.message}` });
                }
                return;
            }

            if (cmd === '!help') {
                const asciiHelp =
                    "```\n" +
                    "╔══╗╔══╗╔╗──╔══╗╔═╗─╔══╗──╔══╗╔══╗\n" +
                    "║╔╗║║╔═╝║║──╚╗╔╝║║╚╗║╔╗║──║╔╗║╚╗╔╝\n" +
                    "║╠╩╣║══╗║║───║║─║╔╗║║║║║──║╠╣║─║║─\n" +
                    "║╚═╝╚══╝╚══╝─╚╝─╚╝╚╝╚══╝──╚╝╚╝─╚╝─\n" +
                    "```\n\n";

                return sock.sendMessage(sender, {
                    text: asciiHelp + `🤖 *BELINDA AI HELP MENU*\n\n` +
                        `*Quiz & Education:*\n` +
                        `📝 !quiz [amount] [subject] [level]\n` +
                        `⏭️ !next (min. 2 users)\n` +
                        `🧹 !reset (Reset quiz data)\n\n` +
                        `*Main Features:*\n` +
                        `🎵 !music {url_spotify/youtube}\n` +
                        `🎬 !video {url_youtube}\n` +
                        `📖 !quran {surah}:{ayah}\n` +
                        `🌦️ !cuaca {nama_kota}\n\n` +
                        `*Generation Tools:*\n` +
                        `🎨 !gen doc:word {prompt}\n` +
                        `🎨 !gen doc:ppt {prompt}\n` +
                        `🎨 !gen doc:excel {prompt}\n` +
                        `💻 !gen scr:{ext} {prompt}\n` +
                        `📦 !gen 3dm:{ext} {prompt}\n\n` +
                        `*Admin & Utility:*\n` +
                        `🤖 !bot (on/off) (Admin Only)\n` +
                        `ℹ️ !info (Cek Status AI)\n` +
                        `💻 !shell {command} (Admin Only)\n` +
                        `➕ !add {nomor} (Admin Only)\n` +
                        `👢 !kick {nomor} (Admin Only)\n` +
                        `🔓 !open / 🔒 !close (Admin Only)\n` +
                        `🧹 !zero (Clear chat history) (Admin Only)\n` +
                        `📝 !log (All)\n`
                });
            }

            if (cmd === '!quiz') {
                const jml = parseInt(args[1]);
                const mapelInput = args[2]?.toLowerCase();
                const diffInput = args[3]?.toLowerCase();
                const validMapel = ['tik', 'mtk', 'ipa', 'ips', 'b.ing', 'b.indo', 'umum', 'sbdp', 'pkwu', 'pai', 'pkn'];
                const validDiff = { 'ez': 'mudah', 'mid': 'sedang/normal', 'hrd': 'susah/olympiad' };

                if (isNaN(jml) || jml < 10 || jml > 30) {
                    return sock.sendMessage(sender, { text: "❌ Jumlah soal minimal 10 dan maksimal 30!" });
                }
                if (!validMapel.includes(mapelInput)) {
                    return sock.sendMessage(sender, { text: `❌ Mapel tidak valid!\nPilihan: ${validMapel.join(', ')}` });
                }
                if (!validDiff[diffInput]) {
                    return sock.sendMessage(sender, { text: "❌ Level tidak valid! Pilih: ez, mid, atau hrd." });
                }

                quizData[sender] = { maxSoal: jml, currentNum: 0, mapel: mapelInput, diff: validDiff[diffInput] };
                await createQuiz(sender);
                return;
            }

            if (cmd === '!next') {
                if (!quizData[sender]) return sock.sendMessage(sender, { text: "⚠️ Mulai kuis dulu!" });
                if (!nextRequests[sender]) nextRequests[sender] = [];
                if (!nextRequests[sender].includes(participant)) nextRequests[sender].push(participant);
                if (nextRequests[sender].length < 2) {
                    return sock.sendMessage(sender, { text: `🔔 *${nextRequests[sender].length}/2* klik !next. Butuh 1 lagi.` });
                }

                const data = quizData[sender];
                const keyLetter = ['A', 'B', 'C', 'D', 'E'][data.index];
                try {
                    const explanationPrompt = `Ini adalah soal kuis ${data.mapel}: "${data.question}". ` +
                        `Jawabannya adalah ${keyLetter}. ` +
                        `Tolong berikan penjelasan/pembahasan singkat kenapa itu jawabannya.`;
                    const exp = await axios.post(`${pythonUrl}/chat`, { sender, msg: explanationPrompt });
                    await sock.sendMessage(sender, { text: `📢 *PEMBAHASAN*\n\n✅ Kunci: *${keyLetter}*\n📖 ${exp.data}` });
                } catch (e) {
                    console.error("Gagal mendapatkan penjelasan:", e.message);
                }
                await createQuiz(sender);
                return;
            }

            if (cmd === '!reset') {
                delete quizData[sender];
                delete nextRequests[sender];
                return sock.sendMessage(sender, { text: "🧹 *Data kuis di grup ini telah direset.* Silakan mulai kuis baru dengan !quiz." });
            }

            if (cmd === '!bot') {
                if (!(await isAdmin())) return;
                const res = await axios.post(`${pythonUrl}/status`, { sender, action: "toggle" });
                return sock.sendMessage(sender, { text: `🤖 AI: ${res.data.active ? 'ON' : 'OFF'}` });
            }

            if (cmd === '!info') {
                const res = await axios.post(`${pythonUrl}/status`, { sender, action: "get" });
                return sock.sendMessage(sender, {
                    text: `*ℹ️ STATUS*\nAI: ${res.data.active ? 'ON ✅' : 'OFF ❌'}\nQuiz: Active ✅`
                });
            }

            // FALLBACK UNKNOWN COMMAND
            return sock.sendMessage(sender, { text: `❌ Perintah *${cmd}* tidak dikenali. Ketik !help untuk melihat daftar perintah.` });
        }

        // RESPON AI
        if (text && !text.startsWith('!')) {
            try {
                const st = await axios.post(`${pythonUrl}/status`, { sender, action: "get" });
                if (st.data.active) {
                    await sock.sendPresenceUpdate('composing', sender);
                    const res = await axios.post(`${pythonUrl}/chat`, { sender, msg: text });
                    await sock.sendMessage(sender, { text: res.data });
                }
            } catch (e) { }
        } else if (m.message && (m.message.audioMessage || (m.message.documentMessage && m.message.documentMessage.mimetype.startsWith('audio/')))) {
            try {
                const st = await axios.post(`${pythonUrl}/status`, { sender, action: "get" });
                if (st.data.active) {
                    await sock.sendPresenceUpdate('recording', sender);
                    const { downloadMediaMessage } = require('baileys');
                    const buffer = await downloadMediaMessage(m, 'buffer', {}, { logger: require('pino')({ level: 'silent' }) });
                    if (buffer) {
                        const FormData = require('form-data');
                        const formData = new FormData();
                        formData.append('sender', sender);
                        formData.append('audio', buffer, 'voice_note.ogg');
                        const res = await axios.post(`${pythonUrl}/voice`, formData, {
                            headers: formData.getHeaders()
                        });
                        await sock.sendMessage(sender, { text: res.data });
                    }
                }
            } catch (e) {
                console.error("Audio processing error:", e.message);
            }
        }
    });
}
connectWA();