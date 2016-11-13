# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
_pkgname=virtualfish
pkgname=python-$_pkgname
pkgver=1.0.5
pkgrel=2
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
depends=('python-virtualenv' 'python-setuptools')
options=(!emptydirs)
install=
source=("${_pkgname}::git+https://github.com/adambrenecki/${_pkgname}.git#tag=1.0.5")
sha1sums=('SKIP')

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
