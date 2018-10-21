# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sub2srt
pkgver=0.5.5
pkgrel=3
pkgdesc="Convert subtitles from .sub to subviewer .srt format"
arch=('any')
url="https://github.com/robelix/sub2srt"
license=('GPL')
depends=('perl')
source=($pkgname-$pkgver.tar.gz::https://github.com/robelix/sub2srt/archive/$pkgver.tar.gz)
sha1sums=('0573f63a30d36990e594210152dd854fe884f0eb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
