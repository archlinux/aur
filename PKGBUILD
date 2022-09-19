# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <hexisXz>
pkgname=ps-lookup
pkgver=1.0.r21.130d142
pkgrel=1
pkgdesc="a simple and easy to use command line app that searches for the process you enter."
arch=(x86_64)
url="https://github.com/hexisXz/ps-lookup.git"
license=('GPL')
source=("ps-lookup::git+https://github.com/hexisXz/ps-lookup.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$pkgname"
  install -Dm755 ps-lookup "$pkgdir/usr/bin"
}
