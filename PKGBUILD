# Maintainer: Sebastian Werner
pkgname=wsk-git
pkgver=0.10.0
pkgrel=1
pkgdesc="pache OpenWhisk Command Line Interface (CLI) https://openwhisk.apache.org/"
arch=('i686' 'x86_64')
url="https://github.com/apache/incubator-openwhisk-cli"
license=('Apache')
replaces=('wsk-git')
conflicts=('wsk-git')
source=($pkgname-src.tar.gz::https://github.com/apache/incubator-openwhisk-cli/releases/download/0.10.0-incubating/OpenWhisk_CLI-0.10.0-incubating-linux-386.tgz)

md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/usr/bin" 
  mv ./wsk "$pkgdir/usr/bin/wsk"
}
