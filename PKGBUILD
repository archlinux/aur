# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=python2-fancycompleter
_realpkg=fancycompleter
pkgver=0.7
pkgrel=1
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://bitbucket.org/antocuni/fancycompleter"
license=('BSD')
depends=('python2' 'pyrepl')
install="$pkgname.install"
source=("https://pypi.python.org/packages/93/33/0fc5fd5ffcd05e60af4f923d0d722e280a3ea348c00f25d0081c794e075c/${_realpkg}-${pkgver}.tar.gz")
md5sums=('fc140f78fa6afe923698cf469df42abd')

package() {
  cd "$srcdir/$_realpkg-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
