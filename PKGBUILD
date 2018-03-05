# Maintainer: Victor Häggqvist <aur a snilius d com>
# https://github.com/victorhaggqvist/archlinux-pkgbuilds
pkgname=python-misaka
_pkgname=misaka
pkgver=2.1.0
pkgrel=1
pkgdesc="A CFFI binding for Hoedown, a markdown parsing library."
arch=('i686' 'x86_64')
url="http://misaka.61924.nl/"
license=('MIT')
depends=('python')
options=(!emptydirs)
conflicts=('python-misaka-v1')
source=("https://pypi.python.org/packages/47/c2/ba9c82ae0ec62bcec62d690e715be6ead4457f83000f4ef6e919f77a8e5f/misaka-2.1.0.tar.gz")
md5sums=('1ffe737992df7e0ab4cce3294487cc2e')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
