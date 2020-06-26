# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=breeze-noir-dark-systemwide
pkgver=2.0
pkgrel=0
pkgdesc="Breeze based global theme for KDE and GTK installed system-wide"
arch=(any)
source=("https://github.com/dus2002/Breeze-Noir-Dark-SystemWide/archive/v"$pkgver".zip")
url="https://store.kde.org/p/1361473"
license=(GPL)
sha256sums=(SKIP)

package() {
   cp -r $srcdir/*/usr ${pkgdir}/usr
}