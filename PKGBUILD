# Maintainer: Ian Lansdowne <IL1185@ccisd.net>
pkgname=pros-cli
pkgver=3.1.4
pkgrel=0
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('x86_64')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc')
makedepends=('python-pip')
source=("https://github.com/purduesigbots/pros-cli/releases/download/$pkgver/pros_cli_v5-$pkgver-py3-none-any.whl")
md5sums=('db329bbe23f37951304ac85c3eff4329')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "$srcdir/pros_cli_v5-$pkgver-py3-none-any.whl"
}
