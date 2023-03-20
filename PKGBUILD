
# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=pvc-git
pkgver=1.0.8
pkgrel=1
epoch=
pkgdesc="command line tool to change version of aur packages"
arch=(x86_64)
url="https://github.com/spynetS/pvc.git"
license=('GPL')
groups=()
depends=(python)
makedepends=(python-pip)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
    pip install flagser
    git clone https://github.com/spynetS/pvc.git pvc
}

package() {
    cd pvc
    install -Dm755 ./pvc.py "$pkgdir/usr/bin/pvc" 
}
