# Mantainer: Daniel Urdiales <daniurdi46@gmail.com>

pkgname=breeze-noir-dark-swstemwide
pkgver=1.0
pkgrel=0
pkgdesc="Breeze based global theme for KDE and GTK installed system-wide"
arch=(any)
source=("git://github.com/dus2002/Breeze-Noir-Dark-SystemWide.git")
url="https://store.kde.org/p/1361473"
license=(GPL)
sha256sums=(SKIP)

prepare() {
   cd $srcdir/*
   git reset --hard v$pkgver
}

package() {
   cp -r $srcdir/*/usr ${pkgdir}/usr
}