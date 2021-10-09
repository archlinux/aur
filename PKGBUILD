# Maintainer: Ilya Zlobintsev <ilya.zl@protonmail.com>

pkgname=twitch-downloader-bin
pkgver=1.40.2
pkgrel=1
pkgdesc="Twitch VOD/Clip Downloader - Chat Download/Render/Replay"
arch=("x86_64")
url="https://github.com/lay295/TwitchDownloader"
license=("MIT")
source=("https://github.com/lay295/TwitchDownloader/releases/download/${pkgver}/TwitchDownloaderCLI-Linux-x64.zip")
sha512sums=('8142186d586842bbdc97a93a77d07e327c5c0e188ca1127b2164432662f3d9f9e0453c789e9129e2bdbd4b7a902c2d5c356f462866dcdee3fc1f6de6ceb508cf')
optdepends=("ffmpeg: rendering videos")
options=(!strip)

package() {
    install -Dm755 "$srcdir/TwitchDownloaderCLI" "$pkgdir/usr/bin/TwitchDownloaderCLI"
}
