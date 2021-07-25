# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=devdash-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="Highly Configurable Terminal Dashboard for Developers"
arch=('x86_64')
url="https://thedevdash.com"
license=('Apache')
provides=('devdash')
conflicts=('devdash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Phantas0s/devdash/releases/download/v${pkgver}/devdash_${pkgver}_Linux_x86_64.tar.gz")
sha512sums=('bf63b48db5d9b5f9900417dafeb42a40305702641687496573ae59e7d6f49792df80675264a3f8c4fc0617f8beb1a8fd02cee5f25a60cdbe2c5de972cc9f2b75')

package(){
  install -Dm755 devdash -t "${pkgdir}/usr/bin"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
