# Maintainer: arkhan <arkhan@disroot.org>
pkgname=python-ueberzug
_pkgname=ueberzug
pkgver=git
pkgrel=1
pkgdesc="ueberzug is an python script which aims to replace w3mimgdisplay"
arch=('any')
url=""
license=('GPL')
depends=("python" "python-xlib")
makedepends=("python")
url='https://github.com/seebye/ueberzug'
source=('git+https://github.com/seebye/ueberzug')
md5sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --prefix=/usr --root "${pkgdir}" || return 1
}

# vim:set ts=2 sw=2 et:
