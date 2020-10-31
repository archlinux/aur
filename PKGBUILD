# Maintainer: Luna Brown <SilicaSandwhich@gmail.com>
pkgname=bibata-cursor-translucent
pkgver=1.1.1
pkgrel=1
pkgdesc="Translucent Material Based Cursor Theme."
arch=('any')
url="https://github.com/Silicasandwhich/Bibata_Cursor_Translucent.git"
license=('GPL')
source=("https://github.com/Silicasandwhich/Bibata_Cursor_Translucent/archive/v${pkgver}.tar.gz")
sha256sums=('6a85015bafbd30e28fe6210f7f2b11caf31ab061bce828ad56374d9da01665fb')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Spirit" "$pkgdir/usr/share/icons/Bibata_Spirit"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Ghost" "$pkgdir/usr/share/icons/Bibata_Ghost"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Tinted" "$pkgdir/usr/share/icons/Bibata_Tinted"
}

