# Maintainer: Daniel Hahler <archlinux+aur@thequod.de>
# Based on https://aur.archlinux.org/packages/python2-fancycompleter
pkgname=python-fancycompleter
_realpkg=fancycompleter
pkgver=0.7
pkgrel=1
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://bitbucket.org/antocuni/fancycompleter"
license=('BSD')
depends=('python')
# pyrepl is optional, and buggy on py3.
optdepends=('python-pyrepl-hg')
install="$pkgname.install"
source=("https://pypi.python.org/packages/93/33/0fc5fd5ffcd05e60af4f923d0d722e280a3ea348c00f25d0081c794e075c/${_realpkg}-${pkgver}.tar.gz")
md5sums=('fc140f78fa6afe923698cf469df42abd')

package() {
  cd "$srcdir/$_realpkg-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
