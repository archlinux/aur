# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=containerlab-bin
pkgver=0.24.1
pkgrel=1
pkgdesc='containerlab enables container-based networking labs'
arch=('x86_64')
provides=(containerlab)
url='https://github.com/srl-labs/containerlab'
license=('BSD')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/srl-labs/containerlab/releases/download/v${pkgver}/containerlab_${pkgver}_Linux_amd64.tar.gz")

sha256sums=('0b216dde14790d8736d2e5d85b5e9615f82c68f0cbdafc6954afc5ba4e95cf8f')

package() {
  install -Dm755 ${pkgname/-bin/} "$pkgdir"/usr/bin/${pkgname/-bin/}
}

