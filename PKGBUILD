# Maintainer: Remenod remenod@gmail.com
pkgname=path-utils
pkgver=1.1.0
pkgrel=1
pkgdesc="useful shell rc PATH managment tools"
arch=('x86_64')
url="https://github.com/Remenod/path-utils"
license=('MIT')

source=("$pkgname::git+https://github.com/Remenod/path-utils.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname/scripts"
    for script in *; do
        install -Dm755 "$script" "$pkgdir/usr/bin/$script"
    done
}
