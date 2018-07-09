# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

pkgname=browsh-bin
pkgver=1.2.2
pkgrel=1
#epoch=
pkgdesc='A fully-modern text-based browser, rendering to TTY and browsers'
arch=('x86_64')
url='https://www.brow.sh'
license=('GPL-3.0')
#groups=()
depends=('firefox>=57')
#makedepends=()
#checkdepends=()
#optdepends=()
provides=('browsh')
conflicts=('browsh' 'browsh-git')
#replaces=()
#backup=()
options=('!strip')
#install=
#changelog=
source=("https://github.com/browsh-org/browsh/releases/download/v1.2.2/browsh_1.2.2_linux_amd64")
#noextract=()
sha512sums=('c6d03edab2fa78c2c1adb733e2a63b58570994901469fb72a8a35e15fded039a1cc56cbe365104df0f16977cbe196bc4fd55162647443ebe8bd1917a59e8890f')
#validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

#build() {
#	cd "$pkgname-$pkgver"
#	./configure --prefix=/usr
#	make
#}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	install -Dm755 browsh_1.2.2_linux_amd64 $pkgdir/usr/bin/browsh
}
