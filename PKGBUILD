# Maintainer: Luna Brown <SilicaSandwhich@gmail.com>
pkgname=bibata-cursor-translucent
pkgver=1.1.2
pkgrel=1
pkgdesc="Translucent Material Based Cursor Theme."
arch=('any')
url="https://github.com/Silicasandwhich/Bibata_Cursor_Translucent.git"
license=('GPL')
source=("https://github.com/Silicasandwhich/Bibata_Cursor_Translucent/archive/v${pkgver}.tar.gz")
sha256sums=('b0398c478c5968977ea092f64b00ecd49e09f0574e8951acc0a32db3b5132930')

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Spirit" "$pkgdir/usr/share/icons/Bibata_Spirit"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Ghost" "$pkgdir/usr/share/icons/Bibata_Ghost"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Tinted" "$pkgdir/usr/share/icons/Bibata_Tinted"
}

