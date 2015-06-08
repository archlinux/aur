# Maintainer: graysky <graysky AT archlinux DOT us>

pkgname='kodi-prevent-xscreensaver'
pkgver=1.15
pkgrel=1
pkgdesc='Keep xscreensaver from coming on when kodi is active.'
arch=('any')
url="https://github.com/graysky2/kodi-prevent-xscreensaver"
depends=('xscreensaver' 'kodi')
replaces='xbmc-prevent-xscreensaver'
license=('MIT')
source=("http://repo-ck.com/source/$pkgname/$pkgname-$pkgver.tar.xz")
install=readme.install
sha256sums=('182bf89adfcfcdfbdcbf5f4f06509c24c2c024699a28cd84a341fcbe743f4621')

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
