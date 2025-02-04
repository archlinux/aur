# Maintainer: robertfoster

pkgname=iortcw-it
pkgver=1.51c
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

sha256sums=('2decc269f8d4292d2e0c3152c5ba4533b40e566b73842b6773f7455fbf3955d7')
