# Maintainer: Sebastian Werner
pkgname=wskdeploy-git
pkgver=0.10.0
pkgrel=1
pkgdesc="Apache OpenWhisk utility for deploying and managing OpenWhisk projects and packages."
arch=('i686' 'x86_64')
url="https://github.com/apache/incubator-openwhisk-wskdeploy"
license=('Apache')
replaces=('wskdeploy-git')
conflicts=('wskdeploy-git')
source=($pkgname-src.tar.gz::https://github.com/apache/incubator-openwhisk-wskdeploy/releases/download/0.10.0-incubating/openwhisk_wskdeploy-0.10.0-incubating-linux-386.tgz)

md5sums=('SKIP')

package() {
  mkdir -p "$pkgdir/usr/bin" 
  mv ./wskdeploy "$pkgdir/usr/bin/wskdeploy"
}
