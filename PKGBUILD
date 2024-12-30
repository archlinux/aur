# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato
pkgname=shiroa-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="A simple tool for creating modern online books in pure typst.(Prebuilt version)"
arch=(
	'aarch64'
	'armv7h'
	'x86_64'
)
url="https://myriad-dreamin.github.io/shiroa/"
_ghurl="https://github.com/Myriad-Dreamin/shiroa"
license=('Apache-2.0')
depends=(
	'glibc'
	'gcc-libs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-aarch64-unknown-linux-gnu.tar.gz")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-armv7-unknown-linux-gnueabihf.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_aarch64=('bf6f829f16b7c3003365d28733051d6b3417477c11e6f4d19e6d665ccbc0f52c')
sha256sums_armv7h=('9c8fd905371ac95ea034b88468354889d5f00668f0bcff7d2433d375c2912e1d')
sha256sums_x86_64=('bec16bcd33227adb07514063a1f82af87ff787132d5439abb4f77d66b3ada8fa')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}-"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}