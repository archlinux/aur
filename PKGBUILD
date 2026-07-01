# Maintainer: musqz <hula-until-satin at duck dot com>
# Upstream author: Sajjad Abdollahzadeh <sajjad606 at gmail dot com>
pkgname=beautysolar-icon-theme
_themename=BeautySolar
pkgver=20260702
pkgrel=1
pkgdesc='Solar-look icon theme based on BeautyLine'
arch=('any')
url='https://github.com/musqz/beautysolar-icon-theme'
license=('GPL-3.0-only')
depends=('hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/musqz/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d8abd0ee2e06c2ce2458153384bb13c647dff2147871242fbbc1c4c6f27ea6a')

package() {
  install -dm755 "$pkgdir/usr/share/icons"
  cp -a "$srcdir/$pkgname-$pkgver/$_themename" "$pkgdir/usr/share/icons/$_themename"
  find "$pkgdir/usr/share/icons/$_themename" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/icons/$_themename" -type f -exec chmod 644 {} +
}
