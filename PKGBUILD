# Maintainer: devome <evinedeng@gmail.com>

pkgname=nali-bin
pkgver=0.3.5
pkgrel=1
pkgdesc="An offline tool for querying IP geographic information and CDN provider."
arch=("x86_64")
url="https://github.com/zu1k/nali"
license=("MIT")
provides=("${pkgname%-bin}")
conflicts=(nali-go)
source=("${pkgname}-${pkgver}.gz::https://github.com/zu1k/nali/releases/download/${pkgver}/${pkgname%-bin}-linux-amd64-${pkgver}.gz")
sha256sums=("fbe45e15824e799ba5ba0fc0d0952b7b332de535e2607688b60e5744704fed67")

package() {
    cd "$srcdir"
    install -Dm755 nali-bin-${pkgver} "${pkgdir}"/usr/bin/nali
}
