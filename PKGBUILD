# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=enginesound-bin
pkgver=1.3.0
pkgrel=3
pkgdesc="Procedural engine sound generator controlled via GUI or CLI"
arch=('x86_64')
url="https://github.com/DasEtwas/enginesound/"
license=('MIT')
provides=('enginesound')
depends=('sdl2')
source=("${pkgname}-${pkgver}::${url}releases/download/v${pkgver}/enginesound-x86_64-linux"
	 	'LICENSE::https://raw.githubusercontent.com/DasEtwas/enginesound/master/LICENSE')
noextract=("${pkgname}-${pkgver}")
sha256sums=('e995b3dd2fa8f5f29c8aa38b707f36277ccd0827334900848cba2e0b40b97ace'
			'e62c3637dab3985bc36b73a985c05908e6dcf50a2f99cab02a45d944e7886c02')

package() {
  install -Dm755 enginesound* -t "${pkgdir}/usr/bin/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}