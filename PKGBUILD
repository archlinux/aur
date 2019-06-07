# Maintainer: arkhan <arkhan@disroot.org>
pkgname=eless
pkgver=0.5
pkgrel=1
pkgdesc="A Better 'less' - A bash script that loads emacs with minimal view-mode config"
arch=('any')
license=('MIT')
depends=("bash" "emacs")
url='https://eless.scripter.co'
source=("https://github.com/kaushalmodi/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('66e282b332feeabaf003512cc817a180')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/doc/eless"
  install -d "$pkgdir/usr/share/licences/eless"
  cp -rf eless "$pkgdir/usr/bin/"
  cp -rf docs "$pkgdir/usr/share/doc/eless"
  cp -rf LICENSE.md "$pkgdir/usr/share/licences/eless/"
}
