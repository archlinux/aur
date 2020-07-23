# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=urw
pkgver=3.62
pkgrel=0
_pkgver=${pkgver}-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://unrealworld.fi"
arch=('x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2' 'curl')
PKGEXT=".pkg.tar"

source=(http://www.unrealworld.fi/dl/${pkgver}/linux/pkg-arch/urw-${_pkgver}-x86_64.pkg.tar.xz)

sha256sums=('9d9c5a4e8f901fc6e2b73956392b66c2db9ab9912129da27b9471ec5c301599e')


package() {
    cd "${pkgdir}"
    tar --warning=no-unknown-keyword -xf "${srcdir}/urw-${_pkgver}-${CARCH}.pkg.tar.xz"
    rm .{MTREE,PKGINFO,BUILDINFO}
}

