pkgname=rib
pkgver=1.0
pkgrel=1
pkgdesc='a simple utility for running applications independently of the console. by castluno'
arch=('any')
license=('MIT')
depends=('bash')
source=('https://raw.githubusercontent.com/castluno/rib/refs/heads/main/main.sh')
sha256sums=('ab57bd7b54f5e997763dc9da6dd43134eeaa45ff430f7725b9765f7489f898ed')

package() {
    install -Dm755 "$srcdir/main.sh" "$pkgdir/usr/bin/rib"
}
