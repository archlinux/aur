# Maintainer: steamport <steamport@protonmail.com>
pkgname=dockbarx-splice-theme-git
pkgver=1
pkgrel=0
pkgdesc="The Splice theme for DockbarX, by phenomenos"
arch=("any")
url="https://github.com/phenomenos/Splice"
license=()
groups=()
depends=()
makedepends=('dockbarx')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=('Splice::git+https://github.com/phenomenos/Splice.git#branch=master')
noextract=()
md5sums=('SKIP')

pkgver() {
  cd Splice
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p "$pkgdir/usr/share/dockbarx/themes"
	cp "$srcdir/Splice/Splice.tar.gz" "$pkgdir/usr/share/dockbarx/themes"
}
