# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
_pkgname=virtualfish
pkgname=python-$_pkgname
pkgver=1.0.1
pkgrel=1
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
depends=('python-virtualenv' 'python-setuptools')
options=(!emptydirs)
install=
source=("https://github.com/adambrenecki/$_pkgname/archive/$pkgver.tar.gz")
sha1sums=("04c7e198428cd174282b0a4d49d50ffdd4c9589b")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
