# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=3.0
pkgrel=1
pkgdesc='Deploy Haskell software for installation'
arch=('x86_64')
url="https://codeberg.org/dinofp/hsinstall"
license=('ISC')
depends=(fuse2)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://codeberg.org/dinofp/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('3fa640525c176472d0bdc2558f526da169c541523f31deacdb353df23afd3556')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
