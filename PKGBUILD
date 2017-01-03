# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=emoj
pkgver=0.4.0
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/emoj"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/$pkgname/archive/v$pkgver.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=('52f2594b4fdf76a664205ac9bd526be95dccf680')

package() {
  cd $srcdir

  install -dm 755 "$pkgdir/usr/lib/node_modules/"
  cd "$pkgdir/usr/lib/node_modules/"
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
