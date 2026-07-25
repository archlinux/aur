# Maintainer: Gulshan Singh <gsingh2011@gmail.com>
pkgname=archutil
pkgver=1.1.2
pkgrel=1
pkgdesc="A tool for listing and backing up explicitly installed packages and for managing config files"
arch=('i686' 'x86_64')
url="https://github.com/rxrc/archutil"
license=('MIT')
depends=('python' 'python-yaml')
source=("archutil-${pkgver}.tar.gz::https://github.com/rxrc/archutil/archive/v${pkgver}.tar.gz")
md5sums=('4a4a0494981a40ba7cf82ec8b45ddab5')

package() {
  cd "$srcdir/$pkgname-$pkgver/bin"
  mkdir -p "$pkgdir/usr/bin"
    cp archutil "$pkgdir/usr/bin"
  cd ..
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
