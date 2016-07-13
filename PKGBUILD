# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-extension-lightning
pkgver=25.2.2
pkgrel=1
pkgdesc="A calendar that's fully integrated into FossaMail."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=('fossamail')
source_i686=(http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-i686.xpi
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-i686.xpi.sig)
source_x86_64=(http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-x86_64.xpi
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-x86_64.xpi.sig)
noextract=("lightning-$pkgver.en-US.linux-$CARCH.xpi")
sha512sums_i686=('4f5e951fe5e27cb12562b8ed78f0cf410a29b2377aff55dcf4b6ec47b46dcedcc302727f2a4471b352abedfc9787621ccf99493ff0075c2e331bbaa73e1dd6c4'
				'SKIP')
sha512sums_x86_64=('81bb8d6fba6459e634902f5d70661e911492f4ad6a5740931834f57805b3acbb12bb7e00ecc4559b37c8646d8d605250ead1bf074a6ea5ef2bd7b77b19bedb62'
				'SKIP')
validpgpkeys=('439F46F42C6AE3D23CF52E70865E6C87C65285EC')

package() {
  install -Dm644 "lightning-${pkgver}.en-US.linux-${CARCH}.xpi" "${pkgdir}/usr/lib/fossamail/extensions/{5f369bc8-d4ab-454d-bfc5-fc555c87dbc4}.xpi"
}