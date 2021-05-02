# Maintainer: AlbonyCal <albonycal at gmail dot com>

pkgname=kiterunner-bin
pkgver=1.0.2
pkgrel=2
pkgdesc=" Contextual Content Discovery Tool "
arch=('x86_64')
url="https://github.com/assetnote/kiterunner"
license=('AGPL-3.0')
provides=('kr')
conflicts=('kr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/assetnote/kiterunner/releases/download/v${pkgver}/kiterunner_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6f0b70aabf747de592445a690281897eebbc45927e9264185d34ffb11637613b')
package(){
  install -Dm755 kr -t "${pkgdir}/usr/bin"
  echo Packaged By @AlbonyCal
}

