pkgname=pitone
pkgver=1.1.0
pkgrel=1
pkgdesc="Linguaggio di programmazione in italiano – eseguibile standalone"
arch=('any')
url="https://github.com/Matxe24/Pitone"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Matxe24/Pitone/archive/refs/heads/main.tar.gz")
md5sums=('SKIP')

package() {
    cd "$srcdir/Pitone-main"
    install -Dm755 linux/pitone "$pkgdir/usr/bin/pitone"
}
