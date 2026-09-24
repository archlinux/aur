# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libretro-azahar-bin
pkgver=2126.1.2
pkgrel=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'libretro-core-info')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/${pkgver}/azahar-libretro-linux-${arch}-${pkgver}.zip")
sha256sums=('184dcb41d0bbf89b9dffeac1573d0b6f8a16648a33abb86e9350d05c93e3f742')

package() {
	cd "$srcdir"
	install -Dm755 azahar_libretro.so -t "$pkgdir/usr/lib/libretro"
}
