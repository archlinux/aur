pkgname="keycat"
pkgver=1.0
pkgrel=1
pkgdesc="Random string generator"
arch=("x86_64")
license=('GPL')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://github.com/SusmithKrishnan/keycat.git")

url="https://github.com/SusmithKrishnan/kcat"
build() {
        cd "$pkgname"
        ./configure --prefix=/usr
        make
}

package() {
        cd "$pkgname"
        make DESTDIR="$pkgdir" install
}
md5sums=('SKIP')
md5sums=('SKIP')
md5sums=('SKIP')
md5sums=('SKIP')
md5sums=('SKIP')
