pkgname=yt-mp3
pkgver=1.0
pkgrel=1
pkgdesc="Simple yt-dlp wrapper to download YouTube audio as high-quality MP3"
arch=('any')
url="https://github.com/Stamer-programer/yt-mp3"
license=('MIT')
depends=('yt-dlp' 'ffmpeg')
source=("yt-mp3")
sha256sums=('SKIP')

package() {
  install -Dm755 "$srcdir/yt-mp3" "$pkgdir/usr/bin/yt-mp3"
}
