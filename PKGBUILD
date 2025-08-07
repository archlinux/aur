# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=infracost-bin
pkgver=0.10.40
pkgrel=1
pkgdesc='Cloud cost estimates for Terraform'
url='https://github.com/infracost/infracost'
arch=('x86_64' 'aarch64')
license=('Apache')
conflicts=('infracost')
provides=('infracost-bin')

source=("infracost-$pkgver-amd64.tar.gz::${url}/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('892fc4997548ce91a135655ced65c7890139bd9c8a17ff2421e9f3f731abbd8e')

package() {
    cd "${srcdir}"
    install -Dm755 "infracost-linux-amd64" "${pkgdir}/usr/bin/infracost"
}
