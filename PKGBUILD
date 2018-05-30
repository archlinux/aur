pkgname=pacman-fix-permissions
pkgver=1.0
pkgrel=1
pkgdesc="small Python script to fix broken Arch Linux filesystem permissions"
arch=('any')
url="https://github.com/droserasprout/$pkgname"
license=('GPL3')
depends=('python')
source=("https://github.com/droserasprout/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

