# Maintainer: hadi latifi <m313hl at gmail dot com>
# Contributor: zamin <dev at zamin dot link>
pkgname=balonet
pkgver=3.0.0
pkgrel=1
pkgdesc="Balonet is a social network, focused on working environment. Balonet helps to address communication and coordination needs of small startups and development groups up to big organizations."
arch=('x86_64')
url="https://balonet.net"
license=('Apache-2.0')
depends=('gconf' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libnotify' 'libxss' 'libxtst' 'nss')
options=('!strip' '!emptydirs')
install=${pkgname}.install
source_x86_64=("https://cdn.balonet.net/files/linux/$pkgname-$pkgver.deb")
sha512sums_x86_64=('956572b95df37b6c77653db800233cc40c1906a518db25c538750e9e6832192fe7e90594e50689d17ef7c39926367fc7eb6b81ca753713c465f6e55e5b1fe769')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"
	install -D -m644 "/opt/balonet/resources/app/node_modules/universalify/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
