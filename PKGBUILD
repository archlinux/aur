# Maintainer: Stezkoy <seracam@yandex.ru>
pkgname=ttf-product-sans
pkgver=1.0
pkgrel=1
pkgdesc="Product Sans is a geometric sans-serif typeface created by Google for branding purposes."
arch=('any')
license=('Proprietary')
depends=('fontconfig' 'xorg-font-utils')
install=ttf-product-sans.install
url="https://www.google.com/"
source=('local://product.ttf')

package() {
	install -Dm0644 product.ttf $pkgdir/usr/share/fonts/TTF/product.ttf
}

sha256sums=('d23139478aa3b37805e6790e32ec724ff5622cffb1633832b062538a3b0055a5')
