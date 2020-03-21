pkgname="stallman"
pkgver=0.1
pkgrel=1
pkgdesc="Liberates your Arch Linux setup via removing non-free software."
arch=("any")
license=('GPL3')
source=("git+https://github.com/devmedoo/${pkgname}.git")
md5sums=('SKIP')
package() {
     cd "$srcdir/${pkgname}"
     sudo cp stallman.sh /usr/bin/stallman
     chmod +x /usr/bin/stallman
}