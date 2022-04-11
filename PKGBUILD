# Maintainer: Dapper Core <Discord: Dapper Core#3723>
pkgname=reddit-video-downloader
pkgver=1.0
pkgrel=1
pkgdesc="A simple shell script that downloads reddit videos given a post url as an mp4. Only uses pure shell scripting, no python, javascript, etc."
arch=('any')
url="https://github.com/DapperCore/reddit-video-downloader.git"
license=('MIT')
depends=(jq wget ffmpeg)
source=(reddit-video-downloader)
md5sums=('SKIP')

package() {
  install -D -t "$pkgdir/usr/bin" "$srcdir/reddit-video-downloader"
}