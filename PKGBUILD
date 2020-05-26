# Maintainer mattf <matheusfillipeag@gmail.com>

pkgbase=xwarp-git
pkgname=xwarp-git
pkgver=0.1
pkgrel=1
pkgdesc="A small X program which facilitates recursively warping the pointer to different quadrants on the screen. The program was inspired by the mousekeys feature of Kaleidoscope, the firmware for the Keyboardio"
url="https://github.com/rvaiya/warp"
license=('GPLV3')
arch=('x86_64')
md5sums=('SKIP')
depends=()
makedepends=(git make libxinerama libxft libxfixes libxtst libx11)
provides=(warp)
source=("git+$url")

package() {
    cd warp
    make
}



#vim: syntax=sh
