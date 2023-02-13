# Maintainer: Nate Simon <njsimon10@gmail.com>

pkgname=kenku-fm-bin
pkgver=1.2.2
pkgrel=2
pkgdesc="Online tabletop audio sharing for Discord"
arch=('x86_64')
license=('GPL3')
depends=('libnotify' 'gtk3' 'nss' 'xdg-utils' 'libdrm' 'libxcb' 'gvfs')
makedepends=()
optdepends=()
provides=('kenku-fm')
conflicts=('kenku-fm-bin')
url="https://github.com/owlbear-rodeo/kenku-fm"

source=("${url}/releases/download/v${pkgver}/kenku-fm_${pkgver}_amd64.deb")
md5sums=('63aaf5186835461b43cbfb4f4ae7a733')


prepare() {
    cd "${srcdir}"
    tar -xvf data.tar.xz
}

package(){
    cd "${srcdir}"
    cp -a usr "${pkgdir}"
}
