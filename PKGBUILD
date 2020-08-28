# Maintainer: Pan Junkai <panjk.panyx@gmail.com>
pkgname=scratux
pkgver=1.4.1
pkgrel=1
pkgdesc="The Linux binary for Scratch"
arch=('x86_64')
url="https://github.com/scratux/scratux/"
license=('BSD-3-Clause')
groups=()
depends=('c-ares'
         'ffmpeg'
         'gtk3'
         'http-parser'
         'libevent'
         'libvpx'
         'libxslt'
         'libxss'
         'minizip'
         'nss'
         're2'
         'snappy'
         'libnotify'
         'libappindicator-gtk3')
provides=(scratux)
source=("${pkgname}-${pkgver}.pacman::https://github.com/scratux/scratux/releases/tag/1.4.1/scratux-1.4.1.pacman")
md5sums=(e341ad8bf3134a652b03143719782371)

package() {
	sed -i '36d' ${pkgname}-${pkgver}.pacman
}
