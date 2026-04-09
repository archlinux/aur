# Maintainer: Aryan Kumar Mishra <aryan.k.mishra.24@gmail.com>
pkgname=phantom-gpu
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool to dynamically disconnect NVIDIA GPUs from the PCI bus to save battery."
arch=('any')
url="https://github.com/aceforaryan/PhantomGPU"
license=('MIT')
depends=('bash' 'psmisc' 'pciutils' 'kmod' 'systemd')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/aceforaryan/PhantomGPU/archive/refs/tags/v${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('SKIP' 'SKIP')

package() {
    cd "PhantomGPU-${pkgver}"
    install -Dm755 "phantom-gpu" "${pkgdir}/usr/bin/phantom-gpu"
    install -Dm644 "../LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
