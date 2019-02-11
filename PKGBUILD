# Maintainer: cylgom <cylgom-at-protonmail-dot-com>

pkgname=stormdrops-cursor-theme
pkgver=3.1
pkgrel=1
pkgdesc="StormDrops Cursor Theme"
arch=('any')
url="https://github.com/cylgom/stormdrops_minimal"
license=('WTFPL')
depends=('tar')
source=("https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal.tar"
		"https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal_dark.tar")
md5sums=('e8a49dc66e825590396c1ce280a44bfa' '3fdb5c9a0ae15fbe4d4270f01e41d4a2')

package() {
    install -d $pkgdir/usr/share/icons/stormdrops_minimal
    install -d $pkgdir/usr/share/icons/stormdrops_minimal_dark
    cp -rf $srcdir/stormdrops_minimal/* $pkgdir/usr/share/icons/stormdrops_minimal
    cp -rf $srcdir/stormdrops_minimal_dark/* $pkgdir/usr/share/icons/stormdrops_minimal_dark
}
