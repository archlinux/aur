# Maintainer: Ian Lansdowne <idlansdowne at gmail dot com>
pkgname=pros-cli
pkgver=3.2.0
pkgrel=0
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('x86_64')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc')
makedepends=('python-pip')
source=("https://github.com/purduesigbots/pros-cli/releases/download/$pkgver/pros_cli-$pkgver-py3-none-any.whl")
md5sums=('1641612ffb2d7f4b695dca851ab7ad63')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "pros_cli-$pkgver-py3-none-any.whl"
}
