# Maintainer: cth451 <cth451@gmail.com>
pkgname=materia-theme
_date=20171213
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
sha256sums=('be1bd5c77339f5441be88b468212dfdc43d510ac7b3b876872dee1ecc77da864')

package() {
  cd "${srcdir}/materia-theme-${_date}"
  destdir="${pkgdir}" ./install.sh
}
