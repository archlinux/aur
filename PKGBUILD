# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=urw
pkgver=3.61
pkgrel=0
_pkgver=${pkgver}-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://unrealworld.fi"
arch=('x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2' 'curl')
PKGEXT=".pkg.tar"

source=(http://www.unrealworld.fi/dl/${pkgver}/linux/pkg-arch/urw-${_pkgver}-x86_64.pkg.tar.xz)

sha256sums=('9e7e74f87c0f69ef51ee4186b96768549a32b4cdfdc5091a0405404a9fc54886')


package() {
    cd "${pkgdir}"
    tar --warning=no-unknown-keyword -xf "${srcdir}/urw-${_pkgver}-${CARCH}.pkg.tar.xz"
    rm .{MTREE,PKGINFO,BUILDINFO}
}

