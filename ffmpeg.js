const { app } = require('electron')
const fs = require('fs')
const path = require('path')
const { execSync } = require('child_process')

const resourceRoot = app.isPackaged
    ? process.resourcesPath
    : path.resolve(__dirname, '../../resources')
const executable = process.platform === 'win32' ? 'ffmpeg.exe' : 'ffmpeg'
const ffmpegPath = path.join(resourceRoot, 'ffmpeg', `${process.platform}-${process.arch}`, executable)

function resolveSystemFfmpeg() {
    for (const candidate of ['/usr/bin/ffmpeg', '/usr/local/bin/ffmpeg']) {
        if (fs.existsSync(candidate)) return candidate
    }
    try {
        const which = execSync('command -v ffmpeg', { stdio: ['ignore', 'pipe', 'ignore'] })
            .toString().trim()
        if (which) return which
    } catch (e) {}
    return null
}

if (!fs.existsSync(ffmpegPath)) {
    const systemFfmpeg = resolveSystemFfmpeg()
    if (systemFfmpeg) {
        module.exports = systemFfmpeg
        return
    }
    throw new Error(`Missing FFmpeg runtime: ${ffmpegPath}. Run npm run ffmpeg:build before starting or packaging the desktop app.`)
}

module.exports = ffmpegPath