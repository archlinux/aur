# Maintainer: bobpaul <aurpackage [at] bobpaul 'period' org>
_pkgname="Obfuscation-Tunnel"
pkgname="${_pkgname,,}-git"
pkgver=r80.cbd31a1
pkgrel=1
epoch=
pkgdesc="Obfuscate UDP traffic to hide from deep packet inspection"
arch=(any)
url="https://github.com/RoliSoft/${_pkgname}"
license=('GPL')
groups=()
depends=('libpcap')
makedepends=('git' 'gcc' 'make')
checkdepends=()
optdepends=()
provides=('obfuscation-tunnel')
conflicts=('obfuscation-tunnel')
replaces=()
backup=()
options=()
install=
changelog=
source=(git+${url}.git)
noextract=()
md5sums=('SKIP')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}


builddir=${_pkgname}
build() {
    cd "$builddir"
	make
}

pkgver(){
	cd "$builddir"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

check() {
	echo $pwd
#cd "$builddir"
}

package() {
	echo $pwd
#cd "$builddir"
}
