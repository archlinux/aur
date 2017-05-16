# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
_date=20170515
_gnomever=3.24
pkgver=${_gnomever}.${_date}
pkgrel=1
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-standard')
optdepends=()
provides=('flatplat-theme' 'flatplat-theme-laptop')
conflicts=('flatplat-theme-git' 'flatplat-theme-laptop')
replaces=()
source=(Flat-Plat-${_date}.tar.gz::"https://github.com/nana-4/Flat-Plat/archive/v${_date}.tar.gz")
sha256sums=('450770d4ffa3d632333f0ae6945eb40663bb6c249cbf21f76de69445a0c8e66e')

package() {
  cd "${srcdir}/Flat-Plat-${_date}"
  destdir="${pkgdir}" ./install.sh
}
