# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=twitch-downloader-bin
pkgver=1.39.11
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-Linux-x64.zip")
sha512sums=('79a51b738873c4f0e6f200198367cf88888da9a0cf959dbfb67ba025d4873fb5f7df01cfb73ef65e522888beb6f8290df4e303d5b1779b4c9c0c03e2ee0d1bbb')
options=(!strip)

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
