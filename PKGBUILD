# Maintainer: Enmanuel Moreira <enmanuelmoreira@gmail.com>

pkgname=infracost-bin
pkgver=0.10.47
pkgrel=1
pkgdesc='Cloud cost estimates for Terraform'
url='https://github.com/infracost/infracost'
arch=('x86_64' 'aarch64')
license=('Apache')
conflicts=('infracost')
provides=('infracost-bin')

source=("infracost-$pkgver-amd64.tar.gz::${url}/releases/download/v${pkgver}/infracost-linux-amd64.tar.gz")
sha256sums=('df098d5565b78cc23de57e1dac9f2a02491691322cbd690dca9b197e3e02fe93')

package() {
    cd "${srcdir}"
    install -Dm755 "infracost-linux-amd64" "${pkgdir}/usr/bin/infracost"
}
