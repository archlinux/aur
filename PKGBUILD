# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=twitch-downloader-bin
pkgver=1.38
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
makedepends=("unzip")
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-Linux-x64.zip")
sha512sums=("bf1cf9120ca6fa35e58659cc23200cf99c2720fda72bdbe91e7535816933327987242fb0bc3709405010a812114f8a06c837cc2ba0c3dbd13b94b998f67bfa7f")
options=(!strip)

prepare() {
    cd "$srcdir"
    unzip -o TwitchDownloaderCLI-Linux-x64.zip
}

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
