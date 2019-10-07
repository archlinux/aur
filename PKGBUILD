# Maintainer: Sebastian Werner
pkgname=wsk-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Apache OpenWhisk Command Line Interface (CLI) https://openwhisk.apache.org/"
arch=('i686' 'x86_64')
url="https://github.com/apache/incubator-openwhisk-cli"
license=('Apache')
replaces=('wsk-git')
conflicts=('wsk-git')
source=($pkgname-src.tar.gz::https://github.com/apache/openwhisk-cli/releases/download/1.0.0/OpenWhisk_CLI-1.0.0-linux-386.tgz)

md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/usr/bin" 
  mv ./wsk "$pkgdir/usr/bin/wsk"
}
