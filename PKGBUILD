# Maintainer: cylgom <cylgom-at-protonmail-dot-com>

pkgname=stormdrops-cursor-theme
pkgver=3.4
pkgrel=1
pkgdesc="StormDrops Cursor Theme"
arch=('any')
url="https://github.com/cylgom/stormdrops_minimal"
license=('WTFPL')
depends=('tar')
source=("https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal.tar"
		"https://github.com/cylgom/stormdrops_minimal/raw/master/dist/stormdrops_minimal_dark.tar")
sha256sums=('fb657d2492a3dfa62db6954452c691fed5d70e0a026981cfccd65db5bcc8f5ce'
			'0809e048c0c30ae05cc01c4a7df2c586fba8aa9dc28b815b7ce7818f2569503d')

package() {
    install -d $pkgdir/usr/share/icons/stormdrops_minimal
    install -d $pkgdir/usr/share/icons/stormdrops_minimal_dark
    cp -rf $srcdir/stormdrops_minimal/* $pkgdir/usr/share/icons/stormdrops_minimal
    cp -rf $srcdir/stormdrops_minimal_dark/* $pkgdir/usr/share/icons/stormdrops_minimal_dark
}
