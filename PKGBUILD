# Maintainer=yuh <yuhldr@qq.com>

pkgname=ldr-translate-qt
pkgdata=ldr-translate
pkgver=1.3.1
pkgrel=8
epoch=
pkgdesc="一个翻译软件，更适合kde桌面，专注文献翻译，可以截图翻译、复制翻译"
arch=('x86_64')
url="https://github.com/yuhldr/ldr-translate"
license=('GPL')
groups=(ldr)
depends=(make python python-pip)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=(ldr-translate-gtk)
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/yuhldr/$pkgdata/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
md5sums=(a5bf142da605f3116159aa0ca10fb355)
validpgpkeys=()

prepare() {
	cd "$pkgdata-$pkgver"
	echo "ldr"
}

build() {
	cd "$pkgdata-$pkgver"
	make qt
}

check() {
	cd "$pkgdata-$pkgver"
	make check-qt
}

package() {
	cd "$pkgdata-$pkgver"
	make install
}
