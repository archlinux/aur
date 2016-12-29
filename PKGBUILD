# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
_date=20161227
_gnomever=3.22
pkgver=${_gnomever}.${_date}
pkgrel=3
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme' 'flatplat-theme-laptop')
conflicts=('flatplat-theme-git' 'flatplat-theme-laptop')
replaces=()
source=("https://github.com/nana-4/Flat-Plat/archive/v${_date}.zip")
sha256sums=('c057beedbedd48698a36bf884c0ab1253a17c91f359b8e3546d6999b7fd8041e')

package() {
  cd "${srcdir}/Flat-Plat-${_date}"
  destdir="${pkgdir}" ./install.sh
}
