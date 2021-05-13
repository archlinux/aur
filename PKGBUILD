# Maintainer: alecromski <alecromski@gmail.com>
pkgname=pomodoro.py
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Pomodoro manager"
arch=('any')
url="https://github.com/kawaegle/Pomodoro"
license=('GPL')
groups=()
depends=('python>=3.8')
makedepends=()
checkdepends=()
optdepends=('ttf-font-awesome: manage some glyph')
provides=(pomodoro.py)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$url""/releases/download/"$pkgver"/"$pkgname"_1.0.zip")
noextract=($source)
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	printf "$(pwd)"
}

package() {
	./install.sh
}
