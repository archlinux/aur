# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
pkgver=3.22.20160921
pkgrel=1
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.22','gtk-engine-murrine', 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme')
conflicts=('flatplat-theme-git')
replaces=()
source=("https://github.com/nana-4/Flat-Plat/releases/download/v${pkgver}/Flat-Plat-${pkgver}.tar.gz")
sha256sums=('b7780b481acd92d9eaf140051bf560bfc8376cbf78e4cad500cf052459aee254')

package() {
  cd "Flat-Plat"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  rm -rf chrome img
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat
}
