# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
pkgver=v20160404
pkgrel=1
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contains chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.18')
optdepends=()
provides=('flatplat-theme')
conflicts=('flatplat-theme-git')
replaces=()
source=("https://github.com/nana-4/Flat-Plat/releases/download/3.18.20160404/Flat-Plat-3.18.20160404.tar.gz")
sha256sums=('df58ed970108daacff0d79cff60ef5b072383a7ebb899ef55cd3cf474f9f8a1f')

package() {
  cd "Flat-Plat"
  install -dm 755 "${pkgdir}"/usr/share/themes/Flat-Plat
  cp -dr --no-preserve='ownership,mode' * "${pkgdir}"/usr/share/themes/Flat-Plat
}
