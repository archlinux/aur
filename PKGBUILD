# Maintainer: VanillaGreen <brad@vanillagreen.com>
pkgname=vsys
pkgver=0.9.0
pkgrel=1
pkgdesc="Terminal dashboard for Linux machines that run AI agents"
arch=('x86_64' 'aarch64')
url="https://github.com/vanillagreencom/vsys"
license=('MIT')
provides=('vsys')
conflicts=('vsys-git')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/vsys-v${pkgver}-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/vsys-v${pkgver}-linux-aarch64.tar.gz")
sha256sums_x86_64=('c3501784cf9e16cda1ca562d39f009f174c3a356920473d1da5c0429f7a6acfa')
sha256sums_aarch64=('a8f47f2c20063aabb6bff7784c0e347fcf0ff77f531318cc84fd18d28ee30967')

package() {
	install -Dm755 "${srcdir}/vsys" "${pkgdir}/usr/bin/vsys"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
