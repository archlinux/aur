# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=qytdl
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="Basic PyQt5 frontend to Youtube-DL"
arch=('any')
url="https://github.com/jahendrie/qytdl"
license=('GPL3')
groups=()
depends=('python>=3.8' 'python-pyqt5>=5.13' 'youtube-dl')
makedepends=('make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/jahendrie/qytdl/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
noextract=()
md5sums=('bb4d9d022c0d019d79057a84992da8df')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PREFIX="$pkgdir/usr" install
	#make DESTDIR="$pkgdir/" install
}
