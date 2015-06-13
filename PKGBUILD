# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=python2-fancycompleter
_realpkg=fancycompleter
pkgver=0.4
pkgrel=1
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://bitbucket.org/antocuni/fancycompleter"
license=('GPL')
depends=('python2' 'pyrepl')
install="$pkgname.install"
source=("http://pypi.python.org/packages/source/f/$_realpkg/$_realpkg-$pkgver.tar.gz")
md5sums=('44667c62c6db6318ca6482f3e0781d31')

package() {
  cd "$srcdir/$_realpkg-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
