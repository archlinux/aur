# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-node-app
pkgver=0.12.0
pkgrel=1
pkgdesc="Composable scaffolding CLI — one command, any Node.js stack"
arch=('any')
url="https://create-awesome-node-app.vercel.app"
license=('MIT')
depends=('nodejs>=24' 'npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('06ba6e6a891af44b672d3541b25489394d5a43c482b59bc58015cdf6c86f8292')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  find "$pkgdir" -type l -xtype l -delete 2>/dev/null || true
}
