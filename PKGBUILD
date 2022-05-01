# Maintainer: AtticFinder65536 <atticventilation-aur at protonmail dot com>

pkgname=('ttf-carrois-gothic-sc')
pkgver=1
pkgrel=1
pkgdesc="A well balanced and modern gothic type family. (small caps)"
url="https://fonts.google.com/specimen/Carrois+Gothic+SC"
license=('OFL')
source=('https://fonts.google.com/download?family=Carrois+Gothic+SC')
b2sums=('75d463e5973a31950c6a811378c08bbb9abaa2982057f245f160df3ef9b21efe4cd6ef26492d2184f24980141498a9795604e1bf343ce5d426d42413d0d50ea2')
arch=('any')

package(){
	# Install license
	install -Dm644 -t "${pkgdir}"/usr/share/licenses/"${pkgname}" OFL.txt

	# Install font
	install -Dm644 -t "${pkgdir}"/usr/share/fonts/TTF CarroisGothicSC-Regular.ttf
}
