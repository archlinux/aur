# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>

pkgname=minc-bin
pkgver=0.1.0
pkgrel=2
pkgdesc="MicroShift in Container"
arch=("x86_64")
url="https://github.com/minc-org/minc"
license=("GPL-3.0-only")
depends=(
    'podman'
)
source=("https://github.com/minc-org/minc/releases/download/v$pkgver/minc_linux_amd64")
b2sums=('3f5a2e54a05374ac7705ec636b78d0a9150e4415714ef06443653e3e85e28a68fdf5bebc0d1d4c004f4b3924b23b96761a0a674a545feb7013abe9567fbd66f5')

package() {
    install -Dm755 "minc_linux_amd64" "${pkgdir}/usr/bin/minc"
}
