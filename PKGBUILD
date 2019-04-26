# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=photoname
pkgver=4.1
pkgrel=1
pkgdesc='Rename JPEG photo files based on shoot date'
arch=('x86_64')
url="https://github.com/dino-/photoname"
license=('ISC')
depends=()
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${CARCH}.AppImage")

sha256sums=('a736b408be90de1a2b3ea37987bcf52ba787921043bebfd17d5bd3678efb2c2f')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
