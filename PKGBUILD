# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=diceware-auto
pkgver=1.2
pkgrel=2
pkgdesc='Randomly generate Diceware passphrases'
arch=('x86_64')
url="https://github.com/dino-/diceware-auto"
license=('ISC')
depends=('fuse2')
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://github.com/dino-/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('a2893c26bd59dbbaa4cd760c4dfe805c6d45dee0b801993c32cdf84352d602ff')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
