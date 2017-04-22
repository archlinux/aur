# Maintainer: enihcam <nanericwang at the google email domain which is .com>
# Contributor: Arun <cute.tec at the google email domain which is .com>

pkgname=walinuxagent
_pkgname=WALinuxAgent
pkgver=2.2.10
pkgrel=1
pkgdesc="Microsoft Azure Linux Guest Agent"
arch=('any')
url="https://github.com/Azure/WALinuxAgent"
license=('Apache')
depends=('python' 'openssh' 'parted' 'net-tools' 'util-linux' 'sudo' 'shadow' 'sed' 'grep' 'iproute2')
makedepends=('python' 'python-setuptools')
checkdepends=()
optdepends=()
provides=("walinuxagent")
conflicts=("walinuxagent")
options=()
install=
changelog=
source=(
  "https://github.com/Azure/WALinuxAgent/archive/v${pkgver}.zip")
sha256sums=(
  '0a1225d3292fab251456a7055a929d38da76d6a913bf5549e42b1d2975112672')

package() {
  cd "$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --prefix="/usr" --optimize=1
}
