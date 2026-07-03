# Maintainer: viewerofall <gallia2717@yahoo.com>
pkgname=veil-host-bin
pkgver=1.8
pkgrel=1
pkgdesc="Nested Wayland compositor — run any GUI app inside your terminal"
arch=('x86_64' 'aarch64')
url="https://github.com/viewerofall/veilTDC"
license=('MIT')
provides=('veil-host')
conflicts=('veil-host')

source_x86_64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-x86_64-unknown-linux-gnu")
source_aarch64=("veil-host::https://github.com/viewerofall/veilTDC/releases/download/v${pkgver}/veil-host-aarch64-unknown-linux-gnu")

sha256sums_x86_64=('40e828ec7e995a4547fc03daa68f9265e406c2c02c7c931cf78dced3a4239613')
sha256sums_aarch64=('SKIP')

package() {
    install -Dm755 "${srcdir}/veil-host" "${pkgdir}/usr/bin/veil-host"
}
