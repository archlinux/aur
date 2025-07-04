# Maintainer: Zaman Huseynli <zamanhuseynli23@gmail.com>
# Backup contact: admin@azccriminal.space
pkgname=whoamio
pkgver=1.0.0
pkgrel=1
pkgdesc="Unix shell tool whomaio which io stat data can be accessed directly how to search files with a-z and 1-9 numbered algorithms and a minimal set of tools to perform iostat tests"
arch=('any')
url="https://azccriminal.space/tools/tools.html"
license=('AGPL2')
depends=()
makedepends=('shc' 'curl')
source=("$pkgname.sh::https://raw.githubusercontent.com/Zamanhuseyinli/whoamio/main/whoamio.sh")
sha256sums=('SKIP')  

build() {
  chmod +x "$srcdir/$pkgname.sh"
  shc -f "$srcdir/$pkgname.sh" -o "$srcdir/$pkgname"
}

package() {
  install -Dm755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 /dev/null "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 /dev/null "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
