# Maintainer: Clayton Craft <clayton@craftyguy.net>

pkgname=urw
pkgver=3.63
pkgrel=1
_pkgver=${pkgver}-1
pkgdesc="UnReal World is a unique low-fantasy roguelike game set in the far north during the late Iron-Age"
url="http://unrealworld.fi"
arch=('x86_64')
license=('custom:Proprietary')
depends=('sdl2_image' 'sdl2_mixer' 'sdl2_net' 'sdl2' 'curl')

source=(http://www.unrealworld.fi/dl/${pkgver}/linux/pkg-arch/urw-${_pkgver}-x86_64.pkg.tar.xz)

sha256sums=('2582725c2562a07e813f047aae1a66c6402c20217c062c8fc8f2b41a654bcc94')


package() {
    cd "${pkgdir}"
    tar --warning=no-unknown-keyword -xf "${srcdir}/urw-${_pkgver}-${CARCH}.pkg.tar.xz"
}
