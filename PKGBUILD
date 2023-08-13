# Maintainer: kyngs <aurmail at kyngs dot xyz>

pkgname=mcman-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Powerful Minecraft Server Manager CLI."
arch=('x86_64')
url="https://github.com/ParadigmMC/mcman"
source=("https://github.com/ParadigmMC/mcman/releases/download/${pkgver}/mcman")
sha256sums=('2e016b70edd718b8307e2fdc8b191af98141695120e0e1168f8de5ca96399e3f')

package() {
  install -Dm 755 "${srcdir}/mcman" "${pkgdir}/usr/bin/mcman"
}
