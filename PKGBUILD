# Maintainer: James Hendrie <hendrie.james@gmail.com>
pkgname=qytdl
pkgver=0.95
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
md5sums=('10d7c2fb1a5d5e8f8d17172f46bc6c0c')
validpgpkeys=()

package() {
	cd "$pkgname-$pkgver"
    echo "$pkgdir"
    make PREFIX="$pkgdir/usr" install
	#make DESTDIR="$pkgdir/" install
}
