# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-node-app
pkgver=0.17.0
pkgrel=1
pkgdesc="Composable scaffolding CLI — one command, any Node.js stack"
arch=('any')
url="https://create-awesome-node-app.vercel.app"
license=('MIT')
depends=('nodejs>=24' 'npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('e6fc9b1d59664b958be3f0cfb1493a426a955f3d90a25732fd61e7dcb6515cab')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  find "$pkgdir" -type l -xtype l -delete 2>/dev/null || true
}
