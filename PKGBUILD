# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=5.3
pkgrel=1
pkgdesc='Rename JPEG photo files based on shoot date'
arch=('x86_64')
url="https://github.com/dino-/photoname"
license=('ISC')
depends=('fuse2' 'zlib')
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('41dd22ad59c08d56ae47a75f12e42af5e1843ecf0aa43942be3ac6cfa3c5fb47')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
