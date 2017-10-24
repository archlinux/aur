# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=mbed-cli
pkgname=python-${_pyname}
pkgver=1.2.2
pkgrel=1
pkgdesc="ARM mbed Command Line Interface"
arch=('any')
url="https://developer.mbed.org"
license=('Apache')
depends=('python2')
optdepends=(
  'git: support git-based mbed projects'
  'mercurial: support mercurial-based mbed projects'
)
options=(!emptydirs)
source=("https://github.com/ARMmbed/mbed-cli/archive/$pkgver.tar.gz")
sha256sums=('bedd9742a99c355eb2e30283eaf28d05ff610083dc5f9506a9216006e70d2ac6')

package() {
  cd "$srcdir/${_pyname}-${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
