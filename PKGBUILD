# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
pkgver=3.20.20160404
pkgrel=1
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contains chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.20')
optdepends=()
provides=('flatplat-theme')
conflicts=('flatplat-theme-git')
replaces=()
source=("https://github.com/nana-4/Flat-Plat/releases/download/${pkgver}/Flat-Plat-${pkgver}.tar.gz")
sha256sums=('cbb53a24a943f894cd4fe5ce35d54d5c9512fdd88812be88cf9e46ac83f53821')

package() {
  cd "Flat-Plat"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat
}
