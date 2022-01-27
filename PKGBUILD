# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.16.1
pkgrel=1
pkgdesc='CLI component for Pomerium'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pomerium/cli"
license=('Apache')
provides=('pomerium-cli')
conflicts=('pomerium-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-amd64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6h.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-armv6.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-armv7.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-arm64.tar.gz")
sha256sums_x86_64=('e2a7a135daf92862651590863986840d62b26b5e52a9ecf8cfed79658e5e5988')
sha256sums_armv6h=('8e26dda56e30f4ad24004861007217ce6fc9232b2046f52eca13e76c0fbcf032')
sha256sums_armv7h=('3b714a9d4c97d4dd968c2d8ec6f847aa19586658bc631aa5364ba629cb97f6b3')
sha256sums_aarch64=('c2000cb112b5cfc208247ede508bf0e74149c47ad5c008c273e04c129a75746b')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
