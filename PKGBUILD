# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=assemblyscript
pkgver=0.17.5
pkgrel=1
pkgdesc="TypeScript to WebAssembly compiler"
arch=('any')
url="https://assemblyscript.org/"
license=('apache')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/assemblyscript/-/assemblyscript-$pkgver.tgz")
sha256sums=('e2b4fb34b6887a43694e8b49c2df037b6434c71744a80ab545657d6f446f10b2')


package() {
  npm install -g --user root --prefix="$pkgdir/usr" "assemblyscript-$pkgver.tgz"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +

  chown -R root:root "$pkgdir"
}
