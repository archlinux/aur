# Maintainer: Victor Häggqvist <aur@snilius.com>
pkgname=python-houdinipy
pkgver=0.1.0
pkgrel=1
pkgdesc="A Python binding for Houdini that provides (un)escaping functions for HTML, URLs/URIs and Javascript."
arch=('i686' 'x86_64')
url="http://python-houdini.61924.nl/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/h/houdini.py/houdini.py-${pkgver}.tar.gz")
sha256sums=('cabd10734a859c34c3707ecb99b93cb78547a9128cbfabbe3f4d5628e822f666')

package() {
  cd "$srcdir/houdini.py-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/houdini.py-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
