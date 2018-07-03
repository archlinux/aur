# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=urw
pkgver=3.51
pkgrel=1
_pkgver=${pkgver}-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://unrealworld.fi"
arch=('x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2' 'curl')
PKGEXT=".pkg.tar"

source=(http://www.unrealworld.fi/dl/${pkgver}/linux/pkg-arch/urw-${_pkgver}-x86_64.pkg.tar.xz)

sha256sums=('52e222f69af47b0913d69d7580fc6f0bba9938a9a4ff1bcb401391cc1e341962')


package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/urw-${_pkgver}-${CARCH}.pkg.tar.xz"
    rm .{MTREE,PKGINFO,BUILDINFO}
}

