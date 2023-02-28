pkg=cdecrypt
pkgname=$pkg-git
pkgver=r29.0fcb3e9
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
