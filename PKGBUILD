# Maintainer: cylgom <cylgom-at-protonmail-dot-com>

pkgname=stormdrops-cursor-theme
pkgver=3.0
pkgrel=1
pkgdesc="StormDrops Cursor Theme"
arch=('any')
url="https://github.com/cylgom/stormdrops_minimal"
license=('WTFPL')
depends=('tar')
source=("https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal.tar"
		"https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal_dark.tar")
md5sums=('4974c9ed7b6bf5a7a8f151482bc37d91' '7454452619b9a8d4fafd3d0733fd7f93')

package() {
    install -d $pkgdir/usr/share/icons/stormdrops_minimal
    install -d $pkgdir/usr/share/icons/stormdrops_minimal_dark
    cp -rf $srcdir/stormdrops_minimal/* $pkgdir/usr/share/icons/stormdrops_minimal
    cp -rf $srcdir/stormdrops_minimal_dark/* $pkgdir/usr/share/icons/stormdrops_minimal_dark
}
