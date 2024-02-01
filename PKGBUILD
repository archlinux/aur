# Maintainer: kyngs <aurmail at kyngs dot xyz>

pkgname=mcman-bin
pkgver=0.4.4
pkgrel=1
pkgdesc="Powerful Minecraft Server Manager CLI."
arch=('x86_64')
url="https://github.com/ParadigmMC/mcman"
source=("https://github.com/ParadigmMC/mcman/releases/download/${pkgver}/mcman")
sha256sums=('6efb803b501fe25e8a3fd96e3afb413f35cd0dfbfd0eaa79fefeffce467ca05c')

package() {
  install -Dm 755 "${srcdir}/mcman" "${pkgdir}/usr/bin/mcman"
}
