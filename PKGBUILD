# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.17.8
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
sha256sums=('684bed3ce0f3b5fe68e3eca9a371f8e3b25580ad553668ef7d3b98f3a3cb51ad')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
