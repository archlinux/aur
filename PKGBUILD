# Maintainer: Sunny <brainworms2002 at gmail dot com>

pkgname="azahar-appimage"

pkgver=2121.rc1

pkgrel=1
epoch=1
pkgdesc="Azahar is an open-source 3DS emulator project based on Citra. (already compiled)"
url="https://azahar-emu.org"
license=("GPL2")
arch=("x86_64")
provides=("azahar")
conflicts=("azahar"
	   "azahar-git")
replaces=()
depends=("ffmpeg"
         "sdl2")
source=("https://github.com/azahar-emu/azahar/releases/download/2121-rc1/azahar.AppImage"
        "azahar.desktop")
sha256sums=('c455f38d2ce829e992d80e9b6bd2d1887cfa2bf667ffaa86d171abdf2eca5499'
            '2550dd1eac11f3d0cd8465f65b6a948b0633e97cc58f27c2847fcd9efc73e650')
options=("!strip")

package(){
 install -D -m 755 "azahar.AppImage"    "$pkgdir/usr/bin/azahar"
 install -D -m 644 "$srcdir/azahar.desktop" -t "$pkgdir/usr/share/applications"
}
