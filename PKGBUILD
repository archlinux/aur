# Maintainer: Your Name <hexisXz>
pkgname=ps-lookup
pkgver=1.0
pkgrel=1
pkgdesc="a simple and easy to use command line app that searches for the process you enter."
arch=(x86_64)
url="https://github.com/hexisXz/ps-lookup.git"
license=('GPL')
source=("ps-lookup::git+https://github.com/hexisXz/ps-lookup.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "1.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
    install -Dm755 ps-lookup "$pkgdir/bin"
}
