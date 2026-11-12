# Maintainer: NasirA1991 <evilleader91@gmail.com>

pkgname=steam-library-mover-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Move installed Steam games between Steam libraries safely (prebuilt)"
arch=('x86_64')
url="https://github.com/NasirA1991/steam-library-mover"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme')
optdepends=('steam: native Steam client' 'flatpak: Flatpak Steam client')
provides=("steam-library-mover=$pkgver")
conflicts=('steam-library-mover')
options=('!debug')
source=("steam-library-mover-$pkgver-1-x86_64.pkg.tar.zst::https://github.com/NasirA1991/steam-library-mover/releases/download/v$pkgver/steam-library-mover-$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('6d89298390197228e35060cf585c8329a094ee3d850f4e8de45e871f3b3aefa5')
noextract=("steam-library-mover-$pkgver-1-x86_64.pkg.tar.zst")

package() {
    bsdtar -xf "$srcdir/steam-library-mover-$pkgver-1-x86_64.pkg.tar.zst" -C "$pkgdir" usr/
}
