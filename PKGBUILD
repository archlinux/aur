# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=bash2048
pkgver=1.0
pkgrel=1
pkgdesc="Bash implementation of 2048 game"
url="https://github.com/mydzor/bash2048"
arch=('any')
license=("Unlicense")
depends=()
provides=('bash2048')
source=("https://github.com/mydzor/bash2048/archive/${pkgver}.tar.gz")

md5sums=('7a8e083ef89d6fbc51a60ce6b6c41f89')

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m 755 bash2048.sh "$pkgdir/usr/bin/bash2048"
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
} 
