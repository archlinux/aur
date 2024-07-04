# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
# Co-Maintainer: Typology <mohammedkaabi64@gmail.com>

pkgname=twitch-downloader-bin
pkgver=1.54.7
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-${pkgver}-Linux-x64.zip")
sha512sums=('92ee6ac878438a5c2dd201d3f7eec88329ca3f124166eab8583656b9db97333620936e43740c8f94c38524aa0a075f78e99d7dcf960dcbc6c9862c0b50f1e675')
optdepends=("ffmpeg: rendering videos")
options=(!strip)

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
