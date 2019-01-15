# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=ttk-themes
pkgver=2.3.0
pkgrel=1
pkgdesc="A group of themes for the ttk extenstions for Tkinter gathered together by RedFantom and created by various authors."
url="https://github.com/RedFantom/ttkthemes"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('tcl' 'tk')
optdepends=('ttk-theme-chooser')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/RedFantom/ttkthemes/archive/2.3.0.tar.gz")

md5sums=('0b7b0c06325258bef7abff352db40959')

build() {
  tar xzf ${pkgver}.tar.gz
  }

package() {
  cd ttkthemes-${pkgver}
  mkdir -p ${pkgdir}/usr/lib/ttkthemes
  cp -r ttkthemes/themes/* ${pkgdir}/usr/lib/ttkthemes/
  }
