# Maintainer: Your Name <calielmusica@gmail.com.com>
pkgname=wpplinkmaker
pkgver=0.4
pkgrel=1
pkgdesc="Creates and opens a whatsapp web link to send a message to a phone number"
arch=('x86_64')
url="https://github.com/Caliel666/wpplinkmaker"
license=('GPL3')
source=(
"https://github.com/Caliel666/wpplinkmaker/releases/download/$pkgver/whatsapp_link_maker"
"https://raw.githubusercontent.com/Caliel666/wpplinkmaker/main/src/wpplinkmaker.png"
"https://raw.githubusercontent.com/Caliel666/wpplinkmaker/main/src/wpplinkmaker.desktop"
)
noextract=()
sha512sums=(
'SKIP'
'SKIP'
'SKIP'
)

package() {
	install -d "${pkgdir}/usr/share/pixmaps/"
	install -d "${pkgdir}/usr/bin/"
	install -d "${pkgdir}/usr/share/applications/"
	install -Dm755 "${srcdir}/whatsapp_link_maker" -C "${pkgdir}/usr/bin/"
	install -Dm644 "${srcdir}/wpplinkmaker.png" -C "${pkgdir}/usr/share/pixmaps/"
	install -Dm644 "${srcdir}/wpplinkmaker.desktop" -C "${pkgdir}/usr/share/applications/"
}
