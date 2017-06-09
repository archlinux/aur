# Maintainer: cth451 <cth451@gmail.com>
pkgname=flatplat-theme
epoch=1
_date=20170605
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
sha256sums=('c138b97dc525de86bad7e43892fcc1e4ec9672472e68e4d6e14292cb6d6e0be2')

package() {
  cd "${srcdir}/Flat-Plat-${_date}"
  destdir="${pkgdir}" ./install.sh
}
