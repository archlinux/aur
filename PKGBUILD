# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=hsinstall
pkgver=2.9
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

sha256sums=('1a9d95f0eead9ec09aa10232d8ebacfdf2f0469cb1e0b2a3bcbb464d5bc11dc3')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
