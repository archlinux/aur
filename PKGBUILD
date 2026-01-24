# Maintainer: Venik1821 <venik1821@gmail.com>
pkgname=aniship-night-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="AniShip Night - anime streaming client"
arch=('x86_64')
url="https://github.com/Veniamin668/AniShip-fork"
license=('MIT')
depends=('gtk3' 'nss' 'libxss' 'libxtst')
provides=('aniship-night')
conflicts=('aniship-night-git')

source=("AniShip-${pkgver}.AppImage::https://github.com/Veniamin668/AniShip-fork/releases/download/v${pkgver}/AniShip-${pkgver}.AppImage")
sha256sums=('SKIP')

package() {
    install -Dm755 "${srcdir}/AniShip-${pkgver}.AppImage" "${pkgdir}/usr/bin/aniship-night"
}
