# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=2.8
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

sha256sums=('1363d15df5c0db4ed0eb362c68246cf1fa6cac2a60c229a1e506e268226891b9')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
