# Maintainer: Max Shaughnessy <max@mshaugh.com>

pkgname=dnscontrol-bin
pkgver=3.23.0
pkgrel=1
pkgdesc="Synchronize your DNS to multiple providers from a simple DSL (binary release)"
arch=('x86_64')
url="https://stackexchange.github.io/dnscontrol/"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("https://github.com/StackExchange/dnscontrol/releases/download/v${pkgver}/dnscontrol_${pkgver}_linux_amd64.tar.gz")
sha256sums=('6b8b7e257be1e9fb3e386ca72a832c4193a2977d7bc3dfba1e613a5d4e72aa0c')

package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
