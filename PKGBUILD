# Maintainer: kyngs <aurmail at kyngs dot xyz>

pkgname=mcman-bin
pkgver=0.4.2
pkgrel=2
pkgdesc="Powerful Minecraft Server Manager CLI."
arch=('x86_64')
url="https://github.com/ParadigmMC/mcman"
source=("https://github.com/ParadigmMC/mcman/releases/download/${pkgver}/mcman")
sha256sums=('a34539536d6aac954006ac793ddcca436fca300e76b5de3c5288fd6a1b906f0c')

package() {
  install -Dm 755 "${srcdir}/mcman" "${pkgdir}/usr/bin/mcman"
}
