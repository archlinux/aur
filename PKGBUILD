# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=py-mkvenv
pkgver=1.5
pkgrel=1
pkgdesc='Automate creation of virtual environments in Python 3 projects'
arch=('x86_64')
url="https://github.com/dino-/py-mkvenv"
license=('ISC')
depends=(fuse2)
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('d13925213279207801dea8a3c841470f16559711f57efd373d5702165f37fd14')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
