# Maintainer: eclairevoyant
_fontname=NomNaTong-Regular.ttf
pkgname=ttf-nomnatong
pkgver=5.01
pkgrel=1
pkgdesc="The Hán-Nôm Coded Character Set and Nom Na Tong Regular Reference Font"
arch=('any')
url="http://www.nomfoundation.org/nom-tools/Nom-Font"
license=('MIT')
source=("https://github.com/nomfoundation/font/releases/download/v$pkgver/$_fontname")
sha256sums=('651bbf31efc5e5b4406df82e61f6a1881faf5f86b73ff2e81c8b82a920f2f645')

package() {
	install -Dm644 -t "${pkgdir}/usr/share/fonts/TTF/" "${srcdir}/${_fontname}"
}
