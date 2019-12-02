# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=2.5
pkgrel=1
pkgdesc='Deploy Haskell software for installation'
arch=('x86_64')
url="https://github.com/dino-/hsinstall"
license=('ISC')
depends=(fuse2)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('0257775c454ea58a25498c4cc69444c79df7a9644c5b3c7c95582fd689baf97c')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
