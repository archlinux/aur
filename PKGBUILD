# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=ttk-theme-chooser
pkgver=1.1
pkgrel=1
pkgdesc="TTK theme chooser is an application to choose and set the default TTK theme"
url="https://github.com/Geballin/TTK-Theme-chooser"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('tcl' 'tk')
optdepends=()
makedepends=(make)
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/Geballin/TTK-Theme-chooser/archive/1.1.tar.gz")

md5sums=('17c185f5d068656fc6ec4d979ad1aea0')

build() {
  tar xzf ${pkgver}.tar.gz
  cd TTK-Theme-chooser-${pkgver}
  ./configure --prefix=/usr
  make
  }

package() {
  cd TTK-Theme-chooser-${pkgver}
  make DESTDIR="${pkgdir}" install
  }
