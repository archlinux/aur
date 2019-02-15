# Maintainer: cylgom <cylgom-at-protonmail-dot-com>

pkgname=stormdrops-cursor-theme
pkgver=3.3
pkgrel=1
pkgdesc="StormDrops Cursor Theme"
arch=('any')
url="https://github.com/cylgom/stormdrops_minimal"
license=('WTFPL')
depends=('tar')
source=("https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal.tar"
		"https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal_dark.tar")
md5sums=('67db7d01f1e4ebbe809592ea4df1754c' 'ecc8a3525986ac5833623cddb0fee147')

package() {
    install -d $pkgdir/usr/share/icons/stormdrops_minimal
    install -d $pkgdir/usr/share/icons/stormdrops_minimal_dark
    cp -rf $srcdir/stormdrops_minimal/* $pkgdir/usr/share/icons/stormdrops_minimal
    cp -rf $srcdir/stormdrops_minimal_dark/* $pkgdir/usr/share/icons/stormdrops_minimal_dark
}
