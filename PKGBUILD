# Maintainer: Ian Lansdowne <idlansdowne at gmail dot com>
pkgname=pros-cli
pkgver=3.2.1
pkgrel=2
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('x86_64')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python-pip' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc')

package() {
   PIP_CONFIG_FILE=/dev/null pip install --isolated --root=$pkgdir --ignore-installed --no-deps pros-cli==$pkgver
}
