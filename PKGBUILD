# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-node-app
pkgver=0.13.0
pkgrel=1
pkgdesc="Composable scaffolding CLI — one command, any Node.js stack"
arch=('any')
url="https://create-awesome-node-app.vercel.app"
license=('MIT')
depends=('nodejs>=24' 'npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('23e998bcba66a310cbd0084786ceca82464866c7ad60f70c74873f875cab9540')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  find "$pkgdir" -type l -xtype l -delete 2>/dev/null || true
}
