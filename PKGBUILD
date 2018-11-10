# Maintainer: clayton@craftyguy.net
pkgname=ttf-gabriola
pkgver=1.0
pkgrel=0
pkgdesc="TTF Font Gabriola"
arch=('any')
url="http://corefonts.sourceforge.net/"
license=('custom:microsoft')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
makedepends=('libarchive>=3.0.2')

provides=('ttf-font')
source=("$pkgname-$pkgver.zip::http://legionfonts.com/download/gabriola")
sha512sums=('00e24839e812d7cfd6fa38be6681520ad514f6fc23f3522f52aadf9ab3dba8aa0fe8dc8c2cb5444cb057b45b940d6145d4c82d5803296ae486da4b9108ba78b4')
package() {
        install -dm755 "$pkgdir/usr/share/fonts/TTF"
        install -m644 "$srcdir/Gabriola.ttf" "$pkgdir/usr/share/fonts/TTF/Gabriola.ttf"
}
