# Maintainer: Your Name Quinn/wolfgang/hexis (qk371994@gmail.com) 
pkgname=hexfetch
pkgver=0.1.r26.cd014e3
pkgrel=1
epoch=
pkgdesc="a simple and fast program that gets simple system information."
arch=(x86_64)
url="https://github.com/hexisXz/hexfetch.git"
license=('MIT')
groups=()
depends=(lsb-release figlet)
makedepends=(git make)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=(SKIP)
validpgpkeys=()

pkgver() {
     cd "${_pkgname}"
     printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
} 


package() {
	cd "$pkgname"
	gcc $pkgname.c -o $pkgname && sudo mv $pkgname /bin/

}
