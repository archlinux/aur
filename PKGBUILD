# Maintainer: Dino Morelli <dino@ui3.info>

pkgname=diceware-auto
pkgver=1.3
pkgrel=1
pkgdesc='Randomly generate Diceware passphrases'
arch=('x86_64')
url="https://codeberg.org/dinofp/diceware-auto"
license=('ISC')
depends=('fuse2')
makedepends=()
# This software comes as an AppImage, auto-stripping by the AUR tools breaks it
options=(!strip)
source=("https://codeberg.org/dinofp/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}-${arch}.AppImage")

sha256sums=('2ef80ea6077283ac2b85748a9ef50367f31f7af3b20028c56ce553b1ee646c6d')


# PKGBUILD functions

package() {
  install -m 755 -D "${pkgname}-${pkgver}-${CARCH}.AppImage" "${pkgdir}/usr/bin/${pkgname}"
}
