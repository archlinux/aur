# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=libretro-azahar-bin
pkgver=2126.0
pkgrel=1
pkgdesc="An open-source 3DS emulator project based on Citra."
arch=('x86_64')
url="https://github.com/azahar-emu/azahar"
license=('GPL-3.0-or-later')
depends=('libgcc' 'libstdc++' 'glibc' 'libretro-core-info')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
source=("$url/releases/download/${pkgver}/azahar-libretro-linux-${arch}-${pkgver}.zip")
sha256sums=('0b92d325e85d8a0645235ffe9c18bf0e7e3c47ddbf63cf534a2677187e9d8800')

package() {
	cd "$srcdir"
	install -Dm755 azahar_libretro.so -t "$pkgdir/usr/lib/libretro"
}
