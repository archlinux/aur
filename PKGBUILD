# Maintainer: Bernhard Walle <bernhard@bwalle.de>

pkgname=cram
pkgver=0.6
pkgrel=1
pkgdesc="Cram is a functional testing framework for command line applications "
arch=('any')
url="https://bitheap.org/cram/"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://bitheap.org/cram/${pkgname}-${pkgver}.tar.gz")
md5sums=('3808e3e7812c68ca962c4db9abac9069')
sha256sums=('5508187940cf6acafa9538446c007428e7ebd413c17b5320505f08fa0bf267ca')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
