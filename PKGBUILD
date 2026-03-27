# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libretro-azahar-bin
pkgver=2125.0.1
pkgrel=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'libretro-core-info')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/${pkgver}/azahar-libretro-linux-${arch}-${pkgver}.zip")
sha256sums=('3945ccebf58732a0eb54d508de950381a69a90b6407667aa347cebb758e59e8e')

package() {
	cd "$srcdir"
	install -Dm755 azahar_libretro.so -t "$pkgdir/usr/lib/libretro"
}
