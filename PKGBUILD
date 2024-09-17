# Maintainer: kyngs <aurmail at kyngs dot xyz>

pkgname=mcman-bin
pkgver=0.4.5
pkgrel=1
pkgdesc="Powerful Minecraft Server Manager CLI."
arch=('x86_64')
url="https://github.com/ParadigmMC/mcman"
source=("$pkgname-$pkgver-mcman::https://github.com/ParadigmMC/mcman/releases/download/${pkgver}/mcman")
sha256sums=('23e89c2b15f1032dcfa921d61a1dcff843cbe8aae7d5b671926b0b8b91243fbd')

package() {
  install -Dm 755 "${srcdir}/$pkgname-$pkgver-mcman" "${pkgdir}/usr/bin/mcman"
}
