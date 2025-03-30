pkgname=sinpass
pkgver=0.1
pkgrel=1
pkgdesc="Open Source Password Manager"
arch=('any')
url="https://github.com/rickert156/SinPass"
license=('GPLv3')
depends=('python')
source=("$pkgname::git+https://github.com/rickert156/SinPass.git")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 SinPass.py "$pkgdir/usr/bin/sinpass"
}
