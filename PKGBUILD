# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=prettier
pkgver=1.9.2
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
sha1sums=('96bc2132f7a32338e6078aeb29727178c6335827')
sha256sums=('1eaf676100c3526c68d194b09af6a941437a73aec2e829053d5cb7e7356c1c60')
