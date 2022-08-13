# Maintainer: eclairevoyant
_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.02
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=('any')
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/releases/download/v$pkgver/$_fontname")
sha256sums=('0dfce49b773b1f94688f1225b538c09db3801317200b7360df4d53338fa7fec1')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" "${srcdir}/${_fontname}"
}
