# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgname=python2-virtualfish
pkgver=1.0.5
pkgrel=3
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
depends=('python2-virtualenv' 'python2-setuptools')
options=(!emptydirs)
install=
source=("virtualfish::git+https://github.com/adambrenecki/virtualfish.git#tag=1.0.5")
sha1sums=("SKIP")

package() {
  cd "$srcdir/virtualfish"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
