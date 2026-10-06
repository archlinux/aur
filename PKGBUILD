# Maintainer: Ulises Jeremias <ulisescf.24@gmail.com>
pkgname=create-awesome-node-app
pkgver=0.17.3
pkgrel=1
pkgdesc="Composable scaffolding CLI — one command, any Node.js stack"
arch=('any')
url="https://create-awesome-node-app.vercel.app"
license=('MIT')
depends=('nodejs>=24' 'npm')
source=("https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz")
sha256sums=('aa50f3b3ed4884bd0365f54fc25fcfb0f803c1efd5e92ece07d0de3aa91caf88')

package() {
  npm install -g --prefix "$pkgdir/usr" "$srcdir/$pkgname-$pkgver.tgz"
  find "$pkgdir" -type l -xtype l -delete 2>/dev/null || true
}
