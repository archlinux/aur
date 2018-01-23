# Maintainer: cth451 <cth451@gmail.com>
pkgname=materia-theme
_date=20180110
_gnomever=3.26
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
replaces=('flatplat-theme' 'flatplat-theme-laptop')
source=(materia-${_date}.tar.gz::"https://github.com/nana-4/materia-theme/archive/v${_date}.tar.gz")
sha256sums=('44e2bfd5abb475a448f3aa9ad9b1d57cf86e6583483b45656a7516fd8070f8f9')

package() {
  cd "${srcdir}/materia-theme-${_date}"
  destdir="${pkgdir}" ./install.sh
}
