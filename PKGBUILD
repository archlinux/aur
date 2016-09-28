# Maintainer: Jonathan Duck <duckbrain30@gmail.com>
pkgname=typora
pkgver=0.9.19
pkgrel=1
epoch=
pkgdesc="Typora will give you a seamless experience as both a reader and a writer."
arch=('x86_64')
filename="${pkgname}_${pkgver}_amd64.deb"
url="https://typora.io/"
license=('Closed')
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
source=("$https://typora.io/./linux/$filename")
noextract=()
md5sums=('30b9881f6d698a5442dff96002d9d812')
validpgpkeys=()

build() {
	ar x "$filename" data.tar.xz
}

package() {
	tar xf data.tar.xz -C "$pkgdir"
}
