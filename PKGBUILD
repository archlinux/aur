# Maintainer: Kyle Shiue <shiue.kyle@gmail.com>
# Maintainer: Ilesh Thiada <ileshkt@gmail.com>
pkgname=ferium-bin
_pkgname=ferium
pkgver=4.0.1
pkgrel=1
pkgdesc="Fast and multi-source CLI program for managing Minecraft mods and modpacks from Modrinth, CurseForge, and Github Releases"
arch=("x86_64")
depends=("gcc-libs" "bzip2")
provides=("ferium")
conflicts=("ferium-gui-bin")
url="https://github.com/gorilla-devs/ferium"
license=('MPL2')
source=("$_pkgname-$pkgver-$pkgrel.zip::https://github.com/gorilla-devs/ferium/releases/download/v$pkgver/ferium-linux-gnu-nogui.zip")
sha256sums=('7064d03951e084042004d8da6738e49c514bfd24d4f97b279623420074ebdd43')

package() {
	cd "$srcdir"
	install -Dm755 "ferium" "$pkgdir/usr/bin/ferium" 
}
