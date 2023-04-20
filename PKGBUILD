
pkgname=webers-git
pkgver=1.0.2
pkgrel=1
epoch=
pkgdesc="A python program that allows components in plain html"
arch=(x86_64)
url="https://github.com/spynetS/webers"
license=('GPL3')
groups=()
depends=(python)
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
source=()
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
        pip install flagser
        git clone https://github.com/spynetS/webers.git
            
}

package() {
        cd webers
        install -Dm755 ./main.py "$pkgdir/usr/bin/webers" 
        install -Dm755 ./dj2.py "$pkgdir/usr/bin/dj2.py" 
        if [ -e /path/to/file ] ; then
            echo "File exists"
        else
            install -Dm755 ./watcher.py "$pkgdir/usr/bin/watcher.py" 
        fi

}
