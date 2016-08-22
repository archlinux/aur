# Maintainer: Quentin Retornaz <quentin dot retornaz at yahoo dot fr>

pkgname=fossamail-extension-lightning
pkgver=25.2.3
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
sha512sums_i686=('e21ce89aa5fd54103a166f71c14de0483a3c8a0b8ee827a3a44dadc5eedc92da5f3b65675f0323f9a1762b8a3185bec0a567dfdbbb2f190eb2876c4dd626c49c'
				'SKIP')
sha512sums_x86_64=('635ed4bfbd28edeaf589cf6af4d59f330fa85ae9deb276ad5acbfa8d867c09c502f8aae774ee673655643c90056f7e82fa051024e6eeb0b9af35f9c8f6843a89'
				'SKIP')
validpgpkeys=('439F46F42C6AE3D23CF52E70865E6C87C65285EC')

package() {
  install -Dm644 "lightning-${pkgver}.en-US.linux-${CARCH}.xpi" "${pkgdir}/usr/lib/fossamail/extensions/{5f369bc8-d4ab-454d-bfc5-fc555c87dbc4}.xpi"
}