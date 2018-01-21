# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=qytdl
pkgver=0.92
pkgrel=1
epoch=
pkgdesc="Basic PyQt5 frontend to Youtube-DL"
arch=('any')
url="https://github.com/jahendrie/qytdl"
license=('GPL3')
groups=()
depends=('python>=3.2' 'python-pyqt5>=5.6' 'pyqt5-common>=5.6' 'youtube-dl')
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
source=("http://www.someplacedumb.net/content/progs/$pkgname/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('d6b8b61ccf04686145cd9576f0f6f896')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PREFIX="$pkgdir/usr" install
	#make DESTDIR="$pkgdir/" install
}
