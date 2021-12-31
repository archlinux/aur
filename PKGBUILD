# Maintainer: ovk <mail@okosh.xyz>
pkgname=dotref
pkgver=1.0.0
pkgrel=1
pkgdesc="Simple tool to manage dotfiles"
arch=('any')
url="https://github.com/ovk/dotref"
license=('MIT')
depends=('python')
makedepends=('git')
source=("git+https://github.com/ovk/dotref.git#tag=v${pkgver}")
sha256sums=('SKIP')

package() {
  cd "${pkgname}"
  python setup.py install --root="${pkgdir}/"
}
