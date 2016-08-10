_realname=iminuit
pkgname="python2-$_realname"
pkgver=1.2
pkgrel=1
pkgdesc="python interface for MINUIT, a physics analysis tool for function minimization."
arch=(any)
url="https://github.com/iminuit/iminuit"
license=('GPL')
depends=(python2 cython2)
options=(!emptydirs)
source=("https://github.com/$_realname/$_realname/archive/v$pkgver.tar.gz")
md5sums=('7510f7295e5ec8b27003294fa5ec6846')


package() {
  cd "$srcdir/$_realname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
