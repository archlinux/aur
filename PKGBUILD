# Maintainer: aps42 <arch@andre-sterba.de>
pkgname=containerlab-bin
pkgver=0.24.0
pkgrel=1
pkgdesc='containerlab enables container-based networking labs'
arch=('x86_64')
provides=(containerlab)
url='https://github.com/srl-labs/containerlab'
license=('BSD')

source=("${pkgname/-bin/}-${pkgver}.tar.gz::https://github.com/srl-labs/containerlab/releases/download/v${pkgver}/containerlab_${pkgver}_Linux_amd64.tar.gz")

sha256sums=('7e3369aa9002fa5e1bbc146d244db6f6788d4f939083039a08a8b060697d90bf')

package() {
  install -Dm755 ${pkgname/-bin/} "$pkgdir"/usr/bin/${pkgname/-bin/}
}

