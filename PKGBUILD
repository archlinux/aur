# Maintainer: cylgom <cylgom-at-protonmail-dot-com>

pkgname=stormdrops-cursor-theme
pkgver=3.2
pkgrel=1
pkgdesc="StormDrops Cursor Theme"
arch=('any')
url="https://github.com/cylgom/stormdrops_minimal"
license=('WTFPL')
depends=('tar')
source=("https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal.tar"
		"https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal_dark.tar")
md5sums=('f8f8555aa9631a3e0af0728a226432e4' 'dc82ba2af0b25ec6d189789b3aaa8e1a')

package() {
    install -d $pkgdir/usr/share/icons/stormdrops_minimal
    install -d $pkgdir/usr/share/icons/stormdrops_minimal_dark
    cp -rf $srcdir/stormdrops_minimal/* $pkgdir/usr/share/icons/stormdrops_minimal
    cp -rf $srcdir/stormdrops_minimal_dark/* $pkgdir/usr/share/icons/stormdrops_minimal_dark
}
