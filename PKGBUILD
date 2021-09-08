# Contributor: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=dmenfm
pkgver=0.1.2
pkgrel=2
pkgdesc="A simple dmenu-based file manager."
url="https://github.com/keenerd/dmenfm"
arch=('any')
license=('GPL')
depends=('dmenu')
makedepends=('git')
source=('git+https://github.com/keenerd/dmenfm.git')
md5sums=('SKIP')

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 dmenfm "$pkgdir/usr/bin/dmenfm"
  install -Dm755 utils/autoprogramselect "$pkgdir/usr/bin/autoprogramselect"
  install -Dm644 plugins/browser/RecursiveSearch "$pkgdir/usr/share/$pkgname/plugins/browser/RecursiveSearch"
}
