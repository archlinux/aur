# Maintainer: cth451 <cth451@gmail.com>
pkgname=materia-theme
_date=20180321
pkgver=${_date}
pkgrel=1
pkgdesc="A Material Design-like flat theme for GTK3, GTK2, Metacity, and GNOME-Shell. This package does not contain chrome skin extension."
arch=('any')
url="https://github.com/nana-4/Flat-Plat"
license=('GPL')
depends=('gtk3>=3.22' 'gtk-engine-murrine' 'gnome-themes-extra')
makedepends=('bc')
optdepends=()
provides=('flatplat-theme' 'flatplat-theme-laptop')
conflicts=('flatplat-theme-git' 'flatplat-theme-laptop')
replaces=('flatplat-theme' 'flatplat-theme-laptop')
source=(materia-${_date}.tar.gz::"https://github.com/nana-4/materia-theme/archive/v${_date}.tar.gz")
sha256sums=('cffa01122dafa14c174ab48b9b7031b5e14483c352822fcbffaf372146353498')

package() {
  cd "${srcdir}/materia-theme-${_date}"
  mkdir -p "${pkgdir}/usr/share/themes"
  ./install.sh -d "${pkgdir}/usr/share/themes"
}
