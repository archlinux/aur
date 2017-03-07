# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
_date=20170307
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
source=(Flat-Plat-${_date}.tar.gz::"https://github.com/nana-4/Flat-Plat/archive/v${_date}.tar.gz")
sha256sums=('f9d356a7933c5e67fa436c573fc7ca0b8aab933d320626565f4cfb2a0e544aa6')

package() {
  cd "${srcdir}/Flat-Plat-${_date}"
  destdir="${pkgdir}" ./install.sh
}
