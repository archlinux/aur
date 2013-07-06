# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgdesc="The iconic font designed for Bootstrap"
pkgver=3.2.1
pkgrel=1
pkgname='otf-font-awesome'
url='http://fortawesome.github.io/Font-Awesome/'
source=("font-awesome-${pkgver}.zip::http://fortawesome.github.io/Font-Awesome/assets/font-awesome.zip")
arch=('any')
install=${pkgname}.install
license=('OFL')

package() {
	install -d -m755 "$pkgdir"/usr/share/fonts/OTF/
	install -m644 "$srcdir"/font-awesome/font/FontAwesome.otf "$pkgdir"/usr/share/fonts/OTF/
}

sha256sums=('0817294beab3958c4e8512b595b9c12c59bbb35cbeed92c80f186d4a383284c8')
