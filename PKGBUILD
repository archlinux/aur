# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=urw
pkgver=3.52
pkgrel=0
_pkgver=${pkgver}-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://unrealworld.fi"
arch=('x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2' 'curl')
PKGEXT=".pkg.tar"

source=(http://www.unrealworld.fi/dl/${pkgver}/linux/pkg-arch/urw-${_pkgver}-x86_64.pkg.tar.xz)

sha256sums=('8a0c6fa3c6806b81b7b06a7e7dde30b4d84acf074b1d2fc44b28cbc7b2269a81')


package() {
    cd "${pkgdir}"
    tar --warning=no-unknown-keyword -xf "${srcdir}/urw-${_pkgver}-${CARCH}.pkg.tar.xz"
    rm .{MTREE,PKGINFO,BUILDINFO}
}

