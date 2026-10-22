# Maintainer: musqz <hula-until-satin at duck dot com>
# Upstream author: Sajjad Abdollahzadeh <sajjad606 at gmail dot com>
pkgname=beautysolar-icon-theme
_themename=BeautySolar
pkgver=20260717
pkgrel=2
pkgdesc='Solar-look icon theme based on BeautyLine'
arch=('any')
url='https://codeberg.org/linux-bird/beautysolar-icon-theme'
license=('GPL-3.0-only')
depends=('hicolor-icon-theme')
source=("$pkgname-$pkgver-codeberg.tar.gz::https://codeberg.org/linux-bird/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('eb13972d7510e9fdac6aeee7320af2b54527a4bbf09a1dbd557da5b03d52b1d6')

package() {
  install -dm755 "$pkgdir/usr/share/icons"
  cp -a "$srcdir/$pkgname/$_themename" "$pkgdir/usr/share/icons/$_themename"
  find "$pkgdir/usr/share/icons/$_themename" -type d -exec chmod 755 {} +
  find "$pkgdir/usr/share/icons/$_themename" -type f -exec chmod 644 {} +
}
