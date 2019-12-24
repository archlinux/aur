# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=qytdl
pkgver=1.02
pkgrel=3
epoch=
pkgdesc="Basic PyQt5 frontend to Youtube-DL"
arch=('any')
url="https://github.com/jahendrie/qytdl"
license=('GPL3')
groups=()
depends=('python>=3.7' 'python-pyqt5>=5.13' 'youtube-dl')
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
source=("http://www.someplacedumb.net/content/progs/$pkgname/$pkgname-$pkgver.tar.xz")
noextract=()
md5sums=('369f492c4a2405508a7e71d418a50143')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PREFIX="$pkgdir/usr" install
	#make DESTDIR="$pkgdir/" install
}
