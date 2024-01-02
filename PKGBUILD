# Maintainer: Tim Rachul <tim.rachul@uni-due.de>
# Maintainer: Mr.Smith1974

pkgname=urw
pkgver=3.71
pkgrel=1
_pkgver=${pkgver}-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://www.unrealworld.fi"
arch=('x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2' 'curl')

source=(http://www.unrealworld.fi/dl/${pkgver}/linux/pkg-arch/urw-${_pkgver}-x86_64.pkg.tar.zst)

sha256sums=('68a95d2fcc4364e4a4cc4122891d7d02d69f9f7bc7bad5eea72519b9d117d411')

package() {
    cd "${pkgdir}"
    tar --warning=no-unknown-keyword -xf "${srcdir}/urw-${_pkgver}-${CARCH}.pkg.tar.zst"
}
