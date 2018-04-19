# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=urw
pkgver=3.50
pkgrel=1
_pkgver=3.50-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://unrealworld.fi"
arch=('x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2' 'curl')
PKGEXT=".pkg.tar"

source=(http://www.unrealworld.fi/dl/${pkgver}/linux/pkg-arch/urw-${_pkgver}-x86_64.pkg.tar.xz)

sha256sums=('5598bc979c9b0e28809b1db633192f5bd4470f54cfaa979a331865f81e6c947f')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/urw-${_pkgver}-${CARCH}.pkg.tar.xz"
}

