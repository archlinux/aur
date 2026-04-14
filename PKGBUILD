# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libretro-azahar-bin
pkgver=2125.1
pkgrel=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'libretro-core-info')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/${pkgver}/azahar-libretro-linux-${arch}-${pkgver}.zip")
sha256sums=('e7aa9701c2c9c59c693cc7ff409cf2bb9a29b25f5ee1e28fb60e9e14c98631e6')

package() {
	cd "$srcdir"
	install -Dm755 azahar_libretro.so -t "$pkgdir/usr/lib/libretro"
}
