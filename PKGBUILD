# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=infracost-bin
pkgver=0.10.33
pkgrel=1
pkgdesc='Cloud cost estimates for Terraform'
url='https://github.com/infracost/infracost'
arch=('x86_64' 'aarch64')
license=('Apache')
conflicts=('infracost')
provides=('infracost-bin')

source=("infracost-$pkgver-amd64.tar.gz::${url}/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('86df61332e2a6e6782ac3e8681c4bac5dccfa976512c64ebd7c5a77f218e1c87')

package() {
    cd "${srcdir}"
    install -Dm755 "infracost-linux-amd64" "${pkgdir}/usr/bin/infracost"
}
