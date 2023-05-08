pkg=cdecrypt
pkgname=$pkg-git
pkgver=r32.0ca58c6
pkgrel=1
pkgdesc="A utility that decrypts Wii U NUS content files."
arch=('any')
url="https://github.com/VitaSmith/cdecrypt"
license=('GPL')
makedepends=('git' 'make')
source=("git+$url")
md5sums=('SKIP')

build() {
    cd $pkg
    make
}

package() {
    cd $pkg
    install -dm755 $pkgdir/usr/bin
    mv $pkg $pkgdir/usr/bin
}
