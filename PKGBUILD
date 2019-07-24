# Maintainer: hadi latifi <m313hl at gmail dot com>
# Contributor: zamin <dev at zamin dot link>
pkgname=balonet
pkgver=2.5.4
pkgrel=1
pkgdesc="Balonet is a social network, focused on working environment. Balonet helps to address communication and coordination needs of small startups and development groups up to big organizations."
arch=('x86_64')
url="https://balonet.net"
license=('Apache-2.0')
depends=('gconf' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://cdn.balonet.net/files/linux/$pkgname-$pkgver.deb")
sha512sums_x86_64=('6c3ecce1b78c7fa0687809c2961209ffc26de4350a1fa9dd7e62a1a99ec15827a854aa73b36aa8be216e5857a93d5c573cb5ac013fcec624424f3b4440ba1d7c')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	echo "i do something!"
	# install -D -m644 "/opt/balonet/resources/app/node_modules/universalify/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
