# Maintainer: Louis Solofrizzo <louis@ne02ptzero.me>
pkgname=shayla
pkgver=1.1
pkgrel=1
pkgdesc="A fast and simple static site generator"
arch=("x86_64")
url="https://git.sr.ht/~ne02ptzero/shayla"
license=("GPL3")
provides=("shayla")
conflicts=("shayla-git")
source=("https://s3.fr-par.scw.cloud/ne02ptzero-binaries/${pkgname}/${pkgver}/x86_64/shayla")
sha256sums=('ce12570f4dc9c5d8650475e8ac8b73ac64dc6b2f74932bd0d878de2ef3c3472d')

package() {
    mkdir -p ${pkgdir}/usr/bin/
    cp ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    chmod +x ${pkgdir}/usr/bin/${pkgname}
}
