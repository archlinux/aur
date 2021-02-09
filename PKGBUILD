# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.18.7
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
sha256sums=('b58e93bdecd636bc2d6266a353bdad925e812dfa686f3a2e5a345581c6d34f5a')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
