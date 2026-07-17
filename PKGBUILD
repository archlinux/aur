# Maintainer: musqz <hula-until-satin at duck dot com>
# Upstream author: Sajjad Abdollahzadeh <sajjad606 at gmail dot com>
pkgname=beautysolar-icon-theme
_themename=BeautySolar
pkgver=20260717
pkgrel=1
pkgdesc='Solar-look icon theme based on BeautyLine'
arch=('any')
url='https://github.com/musqz/beautysolar-icon-theme'
license=('GPL-3.0-only')
depends=('hicolor-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://github.com/musqz/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8a138f343055def320931b6f48ebac490a92490532ad17aad14bd1bbfd445469')

package() {
  install -dm755 "$pkgdir/usr/share/icons"
  cp -a "$srcdir/$pkgname-$pkgver/$_themename" "$pkgdir/usr/share/icons/$_themename"
  find "$pkgdir/usr/share/icons/$_themename" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/icons/$_themename" -type f -exec chmod 644 {} +
}
