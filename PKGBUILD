# Maintainer: abdellatif-dev <abdellatif.devlog@gmail.com>
pkgname=dmenu-abdellatif-git
pkgver=0.5.5
pkgrel=1
pkgdesc="my dmenu costume build"
arch=(x86_64)
url="https://github.com/abdellatif-dev/dmenu-abdelllatif-dev.git"
license=('MIT')
depends=(dash sh glibc coreutils libx11 libxinerama libxft freetype2 fontconfig libfontconfig.so)
makedepends=(git make)
optdepends=()
provides=(dmenu)
conflicts=(dmenu)
replaces=()
install=
changelog=
source=("git+$url")
md5sums=('SKIP')

package() {
	cd dmenu-abdelllatif-dev 
    make DESTDIR="$pkgdir/" clean install
}
