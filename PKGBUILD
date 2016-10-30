# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-extension-lightning
pkgver=25.2.4
pkgrel=1
pkgdesc="A calendar that's fully integrated into FossaMail."
arch=('i686' 'x86_64')
url="http://www.fossamail.org/"
license=('MPL' 'GPL' 'LGPL')
depends=("fossamail=${pkgver}")
source_i686=(http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-i686.xpi
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-i686.xpi.sig)
source_x86_64=(http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-x86_64.xpi
			http://relmirror.fossamail.org/${pkgver}/lightning-${pkgver}.en-US.linux-x86_64.xpi.sig)
noextract=("lightning-$pkgver.en-US.linux-$CARCH.xpi")
sha512sums_i686=('0c2d5681bd195fe8c7a2c066551a8838d0726b1154a530e2cf668eb619a7bceeb29e918f53fe3bd378e7b9907650f31d9cc7b52410abee15c92ff36706e2f9f3'
				'SKIP')
sha512sums_x86_64=('540ed02c89e678dc0edf1e421aa86ba7978496b3371aa4f8a38f3c9791ae35b8ed474ed086dddebd0af2c023723d08803c4ea9e8e3d7c27942e59a3b3ec70e7a'
				'SKIP')
validpgpkeys=('439F46F42C6AE3D23CF52E70865E6C87C65285EC')

package() {
  install -Dm644 "lightning-${pkgver}.en-US.linux-${CARCH}.xpi" "${pkgdir}/usr/lib/fossamail/extensions/{5f369bc8-d4ab-454d-bfc5-fc555c87dbc4}.xpi"
}