# Maintainer: Cole Thompson <cole dot thompson at gmail dot com>
pkgname=bupper-git
pkgver=1
pkgrel=1
pkgdesc="Profile manager for the bup backup system"
arch=('any')
url="https://github.com/tobru/bupper"
license=('MIT')
depends=('bup' 'ruby-os' 'ruby-ptools')
optdepends=('sshfs: SSH restore support')
source=("$pkgname-$pkgver::git+https://github.com/tobru/bupper.git")
md5sums=("SKIP")

package() {
    mkdir -p "$pkgdir/usr/bin"
    chmod +x "$srcdir/$pkgname-$pkgver/bin/bupper"
    cp "$srcdir/$pkgname-$pkgver/bin/bupper" "$pkgdir/usr/bin/"
}
