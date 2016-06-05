# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=fortune-mod-br
pkgver=20080530
pkgrel=1
epoch=
pkgdesc="A collection of several fortune cookies for Portuguese speakers, gathered from various sources, ranging from proverbs to quotations from literature classics."
arch=('any')
url=""
license=('GPL')
groups=()
depends=('fortune-mod')
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
source=("http://ftp.us.debian.org/debian/pool/main/f/fortunes-br/fortunes-br_${pkgver}_all.deb")
noextract=()
md5sums=('0eff031af2ceaa18e8cde437535db4a0')
validpgpkeys=()

prepare() {
    ar p fortunes-br_${pkgver}_all.deb data.tar.gz | tar zx
}

package() {
    mkdir -p "$pkgdir"/usr/share/fortune/
	install -D -m644 "$srcdir"/usr/share/games/fortunes/{brasil,brasil.dat} "$pkgdir"/usr/share/fortune/
}
