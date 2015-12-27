# Maintainer: M0Rf30

pkgname=iortcw-it
pkgver=1.42d
pkgrel=1
pkgdesc="Return to Castle Wolfenstein Single Player Italian Language File"
arch=('any')
url="https://github.com/iortcw/iortcw/releases"
license=('GPL')
conflicts=(iortcw-de iortcw-es iortcw-fr)
source=("https://github.com/iortcw/iortcw/releases/download/$pkgver/patch-data-SP_italiano.zip")

package() {

    cd $srcdir/main
  
  # Move Data to Package Directory
    mkdir -p $pkgdir/opt/iortcw/main
    cp Language.cfg $pkgdir/opt/iortcw/main/
}

md5sums=('23d82460f778b1aa47ee26f60b11f404')
