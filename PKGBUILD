# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Scott Garrett <Wintervenom@archlinux.us>

pkgname=dmenfm
pkgver=0.1.2
pkgrel=1
pkgdesc="A simple dmenu-based file manager."
url="http://wintervenom.mine.nu"
arch=('i686' 'x86_64')
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
