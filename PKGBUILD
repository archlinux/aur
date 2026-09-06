# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=3.1
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

sha256sums=('33646916827bbab1b7ccff08b27d4c5dcfb170ef73418d9cfcbc159a91fa35d8')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
