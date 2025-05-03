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
options=("!strip")
sha256sums=('c455f38d2ce829e992d80e9b6bd2d1887cfa2bf667ffaa86d171abdf2eca5499'
            'a844a5f10a7c6829f9ed9df2881f0b258d900ec73ec37779a3f20cd70ba8c7ce')
package(){
 install -D -m 755 "azahar.AppImage"    "$pkgdir/usr/bin/azahar"
 install -D -m 644 "$srcdir/azahar.desktop" -t "$pkgdir/usr/share/applications"
}
