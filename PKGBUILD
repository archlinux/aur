# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=2.7
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

sha256sums=('02bf12636c8639dc067786d56bbcc9b69385889999a023850578f02935a06284')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
