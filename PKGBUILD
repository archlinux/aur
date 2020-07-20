# Maintainer: Luna Brown <SilicaSandwhich@gmail.com>
pkgname=bibata-cursor-translucent
pkgver=1.1
pkgrel=1
pkgdesc="Translucent Material Based Cursor Theme."
arch=('any')
url="https://github.com/Silicasandwhich/Bibata_Cursor_Translucent.git"
license=('GPL')
source=("https://github.com/Silicasandwhich/Bibata_Cursor_Translucent/archive/v${pkgver}.tar.gz")
sha256sums=('5028ad88f16440a1ecfd4099191740244f7010aa6330fe5ac53daab62cb8fd46')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Spirit" "$pkgdir/usr/share/icons/Bibata_Spirit"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Ghost" "$pkgdir/usr/share/icons/Bibata_Ghost"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Tinted" "$pkgdir/usr/share/icons/Bibata_Tinted"
}

