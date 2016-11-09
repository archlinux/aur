# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
pkgver=3.22.20161109
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
source=("https://github.com/nana-4/Flat-Plat/archive/v${pkgver}.tar.gz")
sha256sums=('6a424ad69175d6c6293f23955faea7b5e7722d00f8d406bdf956331e89a2cf33')

package() {
  cd "Flat-Plat-${pkgver}"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  rm -rf chrome img
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat
}
