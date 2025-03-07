# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Asuka Minato
pkgname=shiroa-bin
pkgver=0.3.0
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
sha256sums_aarch64=('59cc13824efe4532d48d8e1d13049d51c204f0127e6c978031c70aba0970f08b')
sha256sums_armv7h=('8a83f08184e2d15ecac677b0140fa49a9118bb50da77ff6b6791dccd6d8d3ac3')
sha256sums_x86_64=('4b9b0626f7f8e1ff2e8ba057834aa7df962bff3c9ba844fe31164ada1a1cc3fc')
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}-"*/"${pkgname%-bin}" -t "${pkgdir}/usr/bin"
}