# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
# Co-Maintainer: Typology <mohammedkaabi64@gmail.com>

pkgname=twitch-downloader-bin
pkgver=1.56.1
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-${pkgver}-Linux-x64.zip")
sha512sums=('230272fdebe370b997166699c7e9dd54a926fd95d3ffe7028cd198f0204695dc31b64f3da11f18ea5ef499f74d03a0120e19e627127263e855a75b87f5302a69')
optdepends=("ffmpeg: rendering videos")
options=(!strip)

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
