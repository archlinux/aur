# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=twitch-downloader-bin
pkgver=1.37
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
makedepends=("unzip")
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
#license=("")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-Linux-x64.zip")
sha512sums=("55a596eaaaf9b9390859fa729becb336afc850d1608fa84f9f886a5901054822425ad024ba460e6eca1ff212d478584284d9ce17a1945aebe74a36a52f2f5f35")

prepare() {
    cd "$srcdir"
    unzip -o TwitchDownloaderCLI-Linux-x64.zip
}

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
