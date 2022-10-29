# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>
# Co-Maintainer: Typology <mohammedkaabi64@gmail.com>

pkgname=twitch-downloader-bin
pkgver=1.50.5
pkgrel=2
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("$pkgname-$pkgver.zip::https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-Linux-x64.zip")
sha512sums=('6da83196badf32be8c4f7d705536bf6514d069ced63907f4b891f887bdb975f7631897446ebd4e039aa9a1b44acab2c0eee1aabf165079d423239dfe1d89a950')
optdepends=("ffmpeg: rendering videos")
options=(!strip)

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
