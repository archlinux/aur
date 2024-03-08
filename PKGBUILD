# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=infracost-bin
pkgver=0.10.34
pkgrel=1
pkgdesc='Cloud cost estimates for Terraform'
url='https://github.com/infracost/infracost'
arch=('x86_64' 'aarch64')
license=('Apache')
conflicts=('infracost')
provides=('infracost-bin')

source=("infracost-$pkgver-amd64.tar.gz::${url}/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('42739e75351980272e8680dd1abe0158b95a920c16486f62149364f4b882876e')

package() {
    cd "${srcdir}"
    install -Dm755 "infracost-linux-amd64" "${pkgdir}/usr/bin/infracost"
}
