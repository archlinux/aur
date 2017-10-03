# Maintainer: Snakesocks Origin Developers <snakesocks@mail.com>
# I'm really sorry but providing our name is dangerous to us. Github: https://github.com/snakesocks

pkgname=snakesocks
pkgver=1.2
pkgrel=1
pkgdesc="An extensible proxy which prevents some ISP from detecting network traffic."
url="https://github.com/SnakeSocks/$pkgname"
license=("GPL2")
arch=("i686" "x86_64")
depends=("glibc>=2.14")
conflicts=("$pkgname-git")
replaces=("$pkgname-git")
backup=("etc/$pkgname/conf/client.conf" "etc/$pkgname/conf/server.conf")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/snakesocks-linux-$pkgver-all.tar.gz")
sha256sums=("1283331e773e048e206a47581151660ef477db752c44b94499bfdb21514de3bd")

package() {
  export pkgdir
  cd "$pkgver"
  ./install.sh client
  ./install.sh server
}

