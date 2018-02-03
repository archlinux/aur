# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=emoj
pkgver=2.0.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/emoj"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/$pkgname/archive/v$pkgver.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=('7c2d49f26e3ab744c7c929f8d60a63fa9acf4f54')

package() {
  cd $srcdir

  install -dm 755 "$pkgdir/usr/lib/node_modules/"
  cd "$pkgdir/usr/lib/node_modules/"
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
