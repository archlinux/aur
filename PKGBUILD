# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
pkgver=v20151025
pkgrel=2
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contains chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('librsvg' 'gtk-engine-murrine' 'gnome-session>=3.14')
optdepends=()
provides=()
conflicts=()
replaces=()
source=("https://github.com/nana-4/Flat-Plat/releases/download/3.18.20151025/Flat-Plat-3.18.20151025.tar.gz")
sha256sums=('69d9b570cf0f0844937fd75a669419f0b6db982eec0008c37d109980d35fd522')

package() {
  cd "Flat-Plat"
  rm -rf chrome
  rm LICENSE
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat
}
