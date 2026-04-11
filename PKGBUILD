# Maintainer: Raj Bhandari <rajbhandari9761@gmail.com>
pkgname=dlx-git
pkgver=1.0.1
pkgrel=1
pkgdesc="Universal CLI downloader for videos (yt-dlp), torrents, and files (aria2c)"
arch=('any')
url="https://github.com/Phantom-235u/dlx"
license=('MIT')
depends=('python' 'yt-dlp' 'aria2' 'ffmpeg')
makedepends=('git')
provides=('dlx')
conflicts=('dlx')
source=("git+$url.git")
sha256sums=('SKIP')

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 dlx.py "$pkgdir/usr/bin/dlx"
}
