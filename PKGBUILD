pkg=cdecrypt
pkgname=$pkg-git
pkgver=4.7
pkgrel=1
pkgdesc="A utility that decrypts Wii U NUS content files."
arch=(x86_64)
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
    cp $pkg $pkgdir/usr/bin
}
