# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=2.6
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

sha256sums=('166be24af97ee95d0a77609bd9464a6459155e7658b52997fbe099d113b00476')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
