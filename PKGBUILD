# Maintainer: JaydenDev <jdev0894@gmail.com>

pkgname=saurh-git
pkgver=0.1.0edge
pkgrel=1
conflicts=("saurh")
pkgdesc="simple aur helper straight from the source. saurh bleeding edge."
arch=('any')
url="https://github.com/JaydenDev/saurh"
license=('MIT')
provides=("$pkgname")
source=("https://github.com/JaydenDev/saurh/archive/refs/heads/master.tar.gz")
md5sums=("SKIP")
depends=('git')

package() {
  install -Dm755 "$srcdir/saurh-master/saurh" "$pkgdir/usr/bin/saurh"
  install -Dm644 "$srcdir/saurh-master/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

