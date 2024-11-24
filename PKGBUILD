# Maintainer: HinataAoi <solitary.sails AT gmail DOT com>


pkgname=drg_mod_integration-bin
pkgver=0.2.10
pkgrel=2
epoch=
pkgdesc="Deep Rock Galactic mod loader and integration"
arch=("x86_64")
url="https://github.com/trumank/mint"
license=('MIT')
provides=("drg_mod_integration")
depends=('openssl-1.1')
options=('!strip')
source=("${url}/releases/download/v${pkgver}/drg_mod_integration-x86_64-unknown-linux-gnu.tar.xz"
		"drg_mod_integration.desktop")
sha256sums=(
"524a5afedbc551764dbd13d4a3a08fc10888b7fc962d111dbc0bb54bc6ff7b2c"
"690cec0bb502b7d010af9f4ad8b3d3d1ba9ea2062453eacc8cf5220d4236e934"
)

package() {
	cd "$srcdir"
	install -Dm755 drg_mod_integration-x86_64-unknown-linux-gnu/drg_mod_integration "${pkgdir}/usr/bin/drg_mod_integration"
	install -Dm644 drg_mod_integration.desktop "${pkgdir}/usr/share/applications/drg_mod_integration.desktop"
	install -Dm644 drg_mod_integration-x86_64-unknown-linux-gnu/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
