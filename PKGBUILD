# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=ttk-themes
pkgver=3.1.1
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
source=("https://github.com/RedFantom/ttkthemes/archive/v3.1.1.tar.gz")

md5sums=('f3cfe6f1f7f529105624ff5cf5de0b95')

build() {
  tar xzf v${pkgver}.tar.gz
  }

package() {
  cd ttkthemes-${pkgver}
  mkdir -p ${pkgdir}/usr/lib/ttkthemes
  cp -r ttkthemes/themes/* ${pkgdir}/usr/lib/ttkthemes/
  }
