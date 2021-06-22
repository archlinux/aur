# Maintainer Alfred Jophy alfredjophy@protonmail.com
pkgname=motivate
pkgdesc="Gives you a motivational quote"
pkgver=1.0
pkgrel=1
url="https://github.com/AlfredEVOL/motivate"
arch=('x86_64')
makedepends=('git' 'gcc')
license=('MIT')
source=("$pkgname::git+https://github.com/AlfredEVOL/motivate.git")
md5sums=('SKIP')
package() {
       cd "$pkgname"
       make DESTDIR="$pkgdir/" install
}
