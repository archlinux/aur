# Mainer: Peter Babič <babicpet at gmail dot com>
pkgname=scriptbasic
pkgver=2.1_RC1
pkgrel=1
pkgdesc="Scriba compiler for a powerful scripting language/API"
arch=("x86_64")
url="http://www.scriptbasic.org/"
license=('unknown')
groups=()
depends=('postgresql-libs')
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
source=("http://www.scriptbasic.org/download/SB_${pkgver}_Linux.tar.gz"
        "scriptbasic_arch.patch")
noextract=()
md5sums=('374a37fff435d26c08cfe2ed8d694a8e'
         'f026797fd8e695a797e1eee2f04e264a')
validpgpkeys=()

prepare() {
	cd "scriptbasic"
        patch -p1 -i "scriptbasic_arch.patch"
}

#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

#package() {
#	cd "$pkgname-$pkgver"
#	make DESTDIR="$pkgdir/" install
#}
