# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=py-mkvenv
pkgver=1.6
pkgrel=1
pkgdesc='Automate creation of virtual environments in Python 3 projects'
arch=('x86_64')
url="https://github.com/dino-/py-mkvenv"
license=('ISC')
depends=()
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
# options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}")

sha256sums=('695d00ee058fae46b811c0e33303b8f0ab79d1ee6ed79df5317e5006f08b7cd5')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}" "${pkgdir}/usr/bin/${pkgname}"
}
