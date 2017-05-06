# Maintainer: Carlo Capocasa <carlo@capocasa.net>
pkgname=i3-battery-popup-git
pkgver=r16.f63f627
pkgrel=1
epoch=
pkgdesc="A script that shows messages to the user when the battery is almost empty."
arch=(any)
url="https://github.com/rjekker/i3-battery-popup"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
"$pkgname::git+https://github.com/rjekker/i3-battery-popup.git#branch=master"
)
noextract=()
md5sums=(
"SKIP"
)
validpgpkeys=()

prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
}

check() {
	cd "$pkgname"
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  cp "$pkgname/i3-battery-popup" "$pkgdir/usr/bin/$pkgname"
}

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

