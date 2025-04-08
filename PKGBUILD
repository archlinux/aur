# Maintainer: FilaCo <me@filaco.dev>
pkgname=plymouth-theme-pedro-raccoon
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Simple Plymouth theme with Pedro raccoon meme."
arch=(any)
url="https://filaco.dev/projects/plymouth-theme-pedro-raccoon"
license=('MIT')
groups=("plymouth-theme-pedro-raccoon")
depends=("plymouth")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="$pkgname.install"
changelog=
source=("https://github.com/FilaCo/plymouth-theme-pedro-raccoon/releases/download/v$pkgver/pedro-raccoon.zip")
noextract=()
sha256sums=('82d0e96ab00ac07197f62bf4479b4dd31af22a9493f49742024125e14c227ede')
validpgpkeys=()

# prepare() {}

# build() {}

# check() {}

package() {
	cd "$srcdir/pedro-raccoon"
  	mkdir -p "$pkgdir/usr/share/plymouth/themes/pedro-raccoon"
  	cp -r * "$pkgdir/usr/share/plymouth/themes/pedro-raccoon/"
}
