# Maintainer: Phillip Davies <philliptdavies at gmail dot com>
pkgname=pros-cli
pkgver=3.4.3
pkgrel=1
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('x86_64')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python-pip' 'python-jsonpickle' 'python-sentry_sdk' 'python-semantic-version' 'python-requests-futures' 'python-pyserial' 'python-cobs' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc')

package() {
   pip install --root=$pkgdir --ignore-installed --no-deps pros-cli==$pkgver
}
