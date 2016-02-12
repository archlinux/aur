pkgname=chronicle
pkgver=0.1
pkgrel=1
pkgdesc="A command-line journal with optional encryption"
arch=("i686" "x86_64")
url="https://github.com/NorfairKing/$pkgname"
license=('GPL')
provides=("$pkgname")
optdepends=("tar" "openssl")
source=("https://github.com/NorfairKing/chronicle/archive/v0.1.tar.gz")
md5sums=('f37ccab38da6649df50e0bf3f0375c42')


package() {
  local dir="$pkgdir/usr/bin"
  mkdir -p $dir
  cp $pkgname-$pkgver/chronicle.sh "$dir/chronicle"
}
