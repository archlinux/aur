# Maintainer: Swarnaditya Singh <demonkingswarn@protonmail.com>
pkgname=veikk-tablet-driver
pkgver=1.0.3
pkgrel=1
epoch=
pkgdesc="veikk tablet (vk640) driver for arch linux."
arch=(x86_64 i686)
url="https://gitlab.com/DemonKingSwarn/veikk-tablet-driver"
license=('UNKNOWN')
groups=()
depends=()
makedepends=(git)
checkdepends=()
optdepends=()
provides=(veikk-tablet-driver)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

package() {
        cd "$pkgname"
		sudo pacman -U vktablet-1.0.3-1-x86_64.pkg.tar.zst 
}
