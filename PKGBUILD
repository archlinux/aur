# Maintainer: Quinten Kock <quinten@quinten.space>

pkgname=urw
pkgver=3.32
pkgrel=1
_pkgver=3.32-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://unrealworld.fi"
arch=('i686' 'x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2' 'curl')
PKGEXT=".pkg.tar"

source_i686=(http://www.unrealworld.fi/dl/${pkgver}/linux/arch/urw-${_pkgver}-i686.pkg.tar.xz)
source_x86_64=(http://www.unrealworld.fi/dl/${pkgver}/linux/arch/urw-${_pkgver}-x86_64.pkg.tar.xz)

md5sums_i686=('33c65204c80c43405b2fca64a468f00a')
md5sums_x86_64=('74537b77ccbcc037d7ba87c643f2ae4a')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/urw-${_pkgver}-${arch}.pkg.tar.xz"
}

