# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=5.2
pkgrel=1
pkgdesc='Rename JPEG photo files based on shoot date'
arch=('x86_64')
url="https://github.com/dino-/photoname"
license=('ISC')
depends=('fuse2')
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('a18c06759bf0007e79e01ad75a5fade8e10a0ddd73ee9a7887681df1534d8714')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
