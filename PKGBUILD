# Maintainer: Patrick Niklaus <patrick.niklaus@student.kit.edu>
pkgname=i3-gnome
pkgver=5.0
pkgrel=1
pkgdesc="Starts i3 inside a gnome session."
arch=('any')
url="https://github.com/TheMarex/i3-gnome"
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(i3-gnome-5.0.zip::https://github.com/TheMarex/i3-gnome/archive/5.0.zip)
noextract=()
md5sums=('8427a7d55af3071c8194bcef6cd842e9')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
