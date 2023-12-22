# Maintainer: kyngs <aurmail at kyngs dot xyz>

pkgname=mcman-bin
pkgver=0.4.3
pkgrel=1
pkgdesc="Powerful Minecraft Server Manager CLI."
arch=('x86_64')
url="https://github.com/ParadigmMC/mcman"
source=("https://github.com/ParadigmMC/mcman/releases/download/${pkgver}/mcman")
sha256sums=('02440fc5384b9624bbd4099602e6e9606bb6bd55d39fba9c1a50ee51493dfbe2')

package() {
  install -Dm 755 "${srcdir}/mcman" "${pkgdir}/usr/bin/mcman"
}
