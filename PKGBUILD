# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=splitpath
pkgver=1.0
pkgrel=2
pkgdesc='Safely split paths in many ways'
arch=('x86_64')
url="https://github.com/dino-/splitpath"
license=('ISC')
depends=(fuse2)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('32fccf605515d345e0279c8588417d0fc4a60c3961d88e341103f4954879c100')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
