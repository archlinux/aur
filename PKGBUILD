# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
pkgver=3.20.20160821
pkgrel=2
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.20','gtk-engine-murrine', 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme')
conflicts=('flatplat-theme-git')
replaces=()
source=("https://github.com/nana-4/Flat-Plat/releases/download/v${pkgver}/Flat-Plat-${pkgver}.tar.gz")
sha256sums=('d6eb5a3c7208fd37314efc5fb5c737f7767fbc3381b1c6949311d83cf5c02898')

package() {
  cd "Flat-Plat"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  rm -rf chrome img
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat
}
