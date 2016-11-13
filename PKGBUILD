# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
_pkgname=virtualfish
pkgname=python-$_pkgname
pkgver=1.0.5
pkgrel=1
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
depends=('python-virtualenv' 'python-setuptools')
options=(!emptydirs)
install=
source=("https://github.com/adambrenecki/$_pkgname/archive/$pkgver.tar.gz")
sha1sums=('a0a5f57ae917ac87de24be18b4a31a468f22c770')

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
