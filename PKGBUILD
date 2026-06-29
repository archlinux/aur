# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libretro-azahar-bin
pkgver=2125.1.3
pkgrel=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'libretro-core-info')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/${pkgver}/azahar-libretro-linux-${arch}-${pkgver}.zip")
sha256sums=('1d9fab3ac29b2e93b6bf8e9b2ffa2a20e85a2788f914cd873a0c3280ada9c8ae')

package() {
	cd "$srcdir"
	install -Dm755 azahar_libretro.so -t "$pkgdir/usr/lib/libretro"
}
