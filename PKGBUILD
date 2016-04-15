# Maintainer: Matthew Hiles <matthew.hiles@gmail.com>
pkgname=mkinitcpio-tarball-utils
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Provides hooks for booting to a tmpfs"
arch=(any)
url=""
license=('GPL')
groups=()
depends=(mkinitcpio-nfs-utils)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(tarballroot-hook tarballroot-install)
noextract=()
validpgpkeys=()


package() {
	mkdir -p "$pkgdir/usr/lib/initcpio/hooks"
	mkdir -p "$pkgdir/usr/lib/initcpio/install"
	cp tarballroot-hook "$pkgdir/usr/lib/initcpio/hooks/tarball"
	cp tarballroot-install "$pkgdir/usr/lib/initcpio/install/tarball"
}

md5sums=('582ed650034623c4c666905ae4ca900c'
         '4d5a0b0566a929b0af277b53b4990a53')
