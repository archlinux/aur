# Maintainer: Ian Lansdowne <idlansdowne at gmail dot com>
pkgname=pros-cli
pkgver=3.2.1
pkgrel=1
pkgdesc="Command Line Interface for managing PROS projects. Works with V5 and the Cortex"
arch=('x86_64')
url="https://github.com/purduesigbots/pros-cli"
license=('MPL')
depends=('python-pip' 'arm-none-eabi-newlib' 'arm-none-eabi-gcc')
source=("https://github.com/purduesigbots/pros-cli/releases/download/$pkgver/pros_cli-$pkgver-lin-64bit.zip")
md5sums=('b161f079c691cb38e068ea19c897ccda')

package() {
  mkdir $pkgdir/usr/
  cp -rf ./* $pkgdir/usr/
}
