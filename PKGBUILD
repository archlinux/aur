# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=infracost-bin
pkgver=0.10.44
pkgrel=1
pkgdesc='Cloud cost estimates for Terraform'
url='https://github.com/infracost/infracost'
arch=('x86_64' 'aarch64')
license=('Apache')
conflicts=('infracost')
provides=('infracost-bin')

source=("infracost-$pkgver-amd64.tar.gz::${url}/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('a85bf52b6abcc0a101e9c0c36ae7d0274c542346b36948710a89676e51e7da8e')

package() {
    cd "${srcdir}"
    install -Dm755 "infracost-linux-amd64" "${pkgdir}/usr/bin/infracost"
}
