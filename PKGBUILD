# Maintainer: frojy <ultimatefrojy@gmail.com>
pkgname=frotxt
pkgver=0.1.0
pkgrel=1
pkgdesc="A vim-like terminal text editor written in Python"
arch=('any')
url="https://aur.archlinux.org/packages/frotxt"
license=('MIT')
depends=('python')
source=("frotxt.py")
sha256sums=('SKIP')

package() {
    install -Dm755 "$srcdir/frotxt.py" "$pkgdir/usr/bin/frotxt"
}
