# Maintainer: Your Name <nguyenhongky1998@gmail.com>
pkgname=stm32pio
pkgver=0.96
pkgrel=1
#epoch=
pkgdesc="Automate managing STM32CubeMX + PlatformIO projects" 
arch=(x86_64)
url="https://github.com/kynguyen98/stm32pio"
license=('MIT')
#groups=()
depends=(python-pip platformio python jre-openjdk stm32cubemx)
makedepends=(git python-pip)
checkdepends=()
optdepends=('code: for text editing')
provides=(stm32pio)
conflicts=()
replaces=()
backup=()
options=()
#install=
#changelog=
source=("git+$url")
#("$pkgname-$pkgver.tar.gz""$pkgname-$pkgver.patch")
#noextract=()
md5sums=('4f6f9a8e8f8c7909deac4015dc9c2f50')
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
	cd "$pkgname"
	make DESTDIR="$pkgdir/" install
}
