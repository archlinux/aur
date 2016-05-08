# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=python2-fancycompleter
_realpkg=fancycompleter
pkgver=0.5
pkgrel=1
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://bitbucket.org/antocuni/fancycompleter"
license=('GPL')
depends=('python2' 'pyrepl')
install="$pkgname.install"
source=("https://pypi.python.org/packages/2d/4c/753646af3c4eafc6a4e4a0886f1becd09ddb3bb179bd3c350d8ac357b29a/${_realpkg}-${pkgver}.tar.gz")
md5sums=('5eacad3b56b3b6a8435af44df7899e65')

package() {
  cd "$srcdir/$_realpkg-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
