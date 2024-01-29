# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
# Co-Maintainer: Typology <mohammedkaabi64@gmail.com>

pkgname=twitch-downloader-bin
pkgver=1.54.0
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-${pkgver}-Linux-x64.zip")
sha512sums=('289b31db3b4e8277d0eac71080c7253547fa39c8265f1a71909e9d348c986e39e42d5824ff45ce9462619f771e8231e913102ab7c8b5505c8085f9fb4a848beb')
optdepends=("ffmpeg: rendering videos")
options=(!strip)

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
