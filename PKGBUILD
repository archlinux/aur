pkgname="owo"
pkgver=0.1
pkgrel=1
pkgdesc="cli owoifier"
arch=("any")
license=('GPL')
source=("git://github.com/kittenmilk/${pkgname}.git")

build() {
        cd "$pkgname"
        make
}

package() {
        cd "$pkgname"
        sudo make install
}
md5sums=('SKIP')
md5sums=('SKIP')
