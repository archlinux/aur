# Maintainer: Stick <stick@stma.is>

pkgname=atkinson-hyperlegible-fonts
pkgver=1
pkgrel=1
pkgdesc='typeface with greater legibility and readability for low vision readers'
url='https://www.brailleinstitute.org/freefont'
arch=('any')
license=('none')
source=('https://www.brailleinstitute.org/wp-content/uploads/atkinson-hyperlegible-font/Atkinson-Hyperlegible-Font-Print-and-Web-2020-0514.zip')
sha256sums=('9e1a65d53ddadc8253791e958a07bf5aba210ef6155ea9c91b2b4c46bbce53e3')

package() {
	mkdir -p "$pkgdir"/usr/share/fonts/{TTF,OTF}
	install -D -m0644 "$srcdir"/Atkinson-Hyperlegible-Font-Print-and-Web-2020-0514/"Print Fonts"/*.otf "$pkgdir"/usr/share/fonts/OTF/
	install -D -m0644 "$srcdir"/Atkinson-Hyperlegible-Font-Print-and-Web-2020-0514/"Web Fonts"/TTF/*.ttf "$pkgdir"/usr/share/fonts/TTF/
}
