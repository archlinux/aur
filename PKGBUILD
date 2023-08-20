# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.4.3
pkgrel=1
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('x86_64')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python-pipx' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc')

package() {
   export PIPX_HOME="$pkgdir/usr/local"
   export PIPX_BIN_DIR="$pkgdir/usr/bin"
   pipx install pros-cli==$pkgver
}
