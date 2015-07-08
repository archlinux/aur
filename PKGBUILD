# Maintainer: OmeGa <omega [U+0040] mailoo [.] org>

pkgname=gedit-solarized-git
_gitname=solarized-gedit
pkgver=20130409
pkgrel=1
pkgdesc="Precision colors for machines and people."
arch=('any')
url="https://github.com/mattcan/solarized-gedit"
license=('unknown')
depends=('gedit')
makedepends=('git')
source=('git://github.com/mattcan/solarized-gedit.git')
install=$pkgname.install
sha1sums=('SKIP')

pkgver() {
    date -u +%Y%m%d
}

package() {
  cd "$srcdir/$_gitname"
  install -Dm644 solarized-dark.xml \
    "$pkgdir/usr/share/gtksourceview-3.0/styles/solarized-dark.xml"
  install -Dm644 solarized-light.xml \
    "$pkgdir/usr/share/gtksourceview-3.0/styles/solarized-light.xml"
}

# vim:set ts=2 sw=2 et:
