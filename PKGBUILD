# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
# Co-Maintainer: Typology <mohammedkaabi64@gmail.com>

pkgname=twitch-downloader-bin
pkgver=1.50.6
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("$pkgname-$pkgver.zip::https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-Linux-x64.zip")
sha512sums=('d39e15707423faf693b9244f165b93dec34f77e6a6020679bc7bea41b69a6d7ad8835e5257f351f0def37d6ce917dfdd3f04e03ab920bc223dae683b01293ac7')
optdepends=("ffmpeg: rendering videos")
options=(!strip)

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
