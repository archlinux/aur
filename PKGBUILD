# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=5.4
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

sha256sums=('967941b80872ea3827470f68d5be123b962e712e07eb6696949edae92fb2e1e9')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
