# Maintainer: Artjom Simon <artjom.simon@gmail.com>
# Contributor: Orffen <orffen@orffenspace.com>
pkgname=otf-metropolis
pkgver=r11
pkgrel=1
pkgdesc="The Metropolis font, a modern, geometric typeface."
arch=('any')
url="https://github.com/chrismsimpson/Metropolis"
license=('UNLICENSE')
provides=("${pkgname}")
replaces=("${pkgname}-git")
conflicts=('otf-metropolis')
source=('https://fontsarena.com/wp-content/uploads/2018/11/Metropolis-r11.zip')
sha256sums=('a9efb018df3fae5d39fcd3d05418bce35c4f88ecbf9c3eb54ffff7dbfdf79466')

package() {
	install -d "${pkgdir}/usr/share/fonts/OTF/"
	install -m644 Metropolis-$pkgver/Fonts/OpenType/Metropolis-*.otf "${pkgdir}/usr/share/fonts/OTF/"

	install -d "${pkgdir}/usr/share/licenses/${pkgname}"
	install -m644 "Metropolis-$pkgver/UNLICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
}
