# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=5.5
pkgrel=1
pkgdesc='Rename JPEG photo files based on shoot date'
arch=('x86_64')
url="https://codeberg.org/dinofp/photoname"
license=('ISC')
depends=('fuse2' 'zlib')
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://codeberg.org/dinofp/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('1afdd9cf5770bafb8700d0d913f3a6f38d2f45ca560a17afa558ce3ca1b23896')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
