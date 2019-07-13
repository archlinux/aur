# Maintainer: Dan Brown <SilicaSandwhich@gmail.com>
pkgname=bibata-cursor-translucent
pkgver=1.0.1
pkgrel=1
pkgdesc="Translucent Material Based Cursor Theme."
arch=('any')
url="https://github.com/Silicasandwhich/Bibata_Cursor_Translucent.git"
license=('GPL')
makedepends=('inkscape' 'gnome-themes-extra' 'gtk-engine-murrine' 'xorg-xcursorgen')
source=("https://github.com/Silicasandwhich/Bibata_Cursor_Translucent/archive/v${pkgver}.tar.gz")
sha256sums=('21e5af9d34d87083f51625cb72bbb2b19b63c2542bde03c878ae7bbe85fb7fc1')

build() {
	cd "$srcdir/Bibata_Cursor_Translucent-${pkgver}"
	./build.sh
}

package() {
	mkdir -p "$pkgdir/usr/share/icons"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Spirit" "$pkgdir/usr/share/icons/Bibata_Spirit"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Ghost" "$pkgdir/usr/share/icons/Bibata_Ghost"
	mv "$srcdir/Bibata_Cursor_Translucent-${pkgver}/Bibata_Tinted" "$pkgdir/usr/share/icons/Bibata_Tinted"
}

