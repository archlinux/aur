# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.17.2
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
sha256sums=('49d4c03c417e41c8b60cdd6fb511ad5d322240539e4d88828162636d2fe7ff1c')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
