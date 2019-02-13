# Maintainer: ohli <olifriedrich@gmail.com>

pkgname=specmatch
pkgver=0.9
pkgrel=2
pkgdesc="Can be used to produce your own Impulse Responses and to adapt the sound produced by a Guitarix
setting to another recorded sound."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/guitarix/files/specmatch/"
license=('GPL')
groups=()
depends=('guitarix2' 'jack' 'python2' 'python2-matplotlib' 'pygtk' 'python2-numpy' 'python2-scipy' 'python2-pip' )
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
source=("https://sourceforge.net/projects/guitarix/files/specmatch/python-$pkgname-$pkgver.tar.gz/download")
noextract=()
md5sums=('032ac92fd766a4f5707075a935c35d5d')
validpgpkeys=()

prepare() {
    pip2 install --install-option="--prefix=$pkgdir" scikits.audiolab 
}

package () {
	cd "$pkgname"
    sudo python2 ./setup.py install
}

