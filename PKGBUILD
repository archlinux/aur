# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=qytdl
pkgver=0.8
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
md5sums=('36066022082a0fd54e47c44f655184ee')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PREFIX="$pkgdir/usr" install
	#make DESTDIR="$pkgdir/" install
}
