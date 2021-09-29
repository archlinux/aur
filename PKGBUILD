# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=ttk-themes
pkgver=3.2.2
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
source=("https://github.com/RedFantom/ttkthemes/archive/v${pkgver}.tar.gz")

md5sums=('5a15968eec2d671992707c6e204d71e1')

build() {
  tar xzf v${pkgver}.tar.gz
  }

package() {
  cd ttkthemes-${pkgver}
  mkdir -p ${pkgdir}/usr/lib/ttkthemes
  cp -r ttkthemes/themes/* ${pkgdir}/usr/lib/ttkthemes/
  }
