# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=prettier
pkgver=1.9.1
pkgrel=1
pkgdesc="An opinionated code formatter for JavScript, ES2017, JSX, Flow, TypeScript, JSON, CSS, LESS, SCSS, GraphQL, Markdown"
arch=(any)
url="https://github.com/jlongster/prettier"
license=('MIT')
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

# vim:set ts=2 sw=2 et:
sha1sums=('41638a0d47c1efbd1b7d5a742aaa5548eab86d70')
sha256sums=('6d4774f6d6f02321b1958e8c78abc54ddc0c4ba251bc00936a351b26b918bcb2')
