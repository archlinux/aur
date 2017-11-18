# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=firefox-foxygestures
pkgver=1.0.13
pkgrel=3
pkgdesc='Mouse gestures for Firefox, a web extension alternative to FireGestures'
url='https://addons.mozilla.org/en-US/firefox/addon/foxy-gestures/'
arch=('any')
license=('LGPL')
source=("${pkgname}-${pkgver}.xpi::https://addons.cdn.mozilla.net/user-media/addons/803317/foxy_gestures-${pkgver}-an+fx.xpi")
noextract=("${pkgname}-${pkgver}.xpi")
sha256sums=('8b0547a200d89bc1af53b4f29365830436b9c1b082519bd629ebb4dbd8938c02')

package() {
	install -D -m0644 "${pkgname}-${pkgver}.xpi" "${pkgdir}/usr/lib/firefox/browser/extensions/{e839c3f9-298e-4cd0-99e0-464431cb7c34}.xpi"
}

