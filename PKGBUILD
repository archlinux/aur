# Maintainer: Ganit Kumar <ganit44@gmail.com>
pkgname=hangman-lite
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Simple CLI hangman game"
arch=('i686' 'x86_64')
url="ganit44.github.io"
license=('unknown')
groups=()
depends=('words')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("http://ganit44.github.io/hangman-lite.tar.gz")
md5sums=('207531afd681107f847753969cbd35be')
validpgpkeys=()

package() {
	install -D -m 755 "${srcdir}/hangman" "${pkgdir}/usr/bin/hangman"
}

