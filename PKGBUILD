# Maintainer: Alan Hardman <alan@phpizza.com>

pkgname=ffmpeg-yt-dlp-bin
pkgver=latest
pkgrel=1
pkgdesc="FFmpeg Builds for yt-dlp"
arch=("x86_64")
license=("GPL")
url="https://github.com/yt-dlp/FFmpeg-Builds"
provides=("ffmpeg")
conflicts=("ffmpeg")
source=("ffmpeg-master-${pkgver}-linux64-gpl.tar.xz::${url}/releases/download/${pkgver}/ffmpeg-master-${pkgver}-linux64-gpl.tar.xz")
md5sums=("SKIP")

package() {
    cd "$srcdir/ffmpeg-master-${pkgver}-linux64-gpl"
    install -Dm755 -t "$pkgdir/usr/bin" bin/ffmpeg bin/ffplay bin/ffprobe
}

