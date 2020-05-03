# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
pkgname=emoj
pkgver=3.0.1
pkgrel=1
pkgdesc="Find relevant emoji from text on the command-line"
arch=("any")
url="https://github.com/sindresorhus/emoj"
license=('MIT')
depends=('nodejs' 'xsel')
makedepends=('npm')
source=(https://github.com/sindresorhus/$pkgname/archive/v$pkgver.tar.gz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=('41ada7b8dc827727505c12deea0344cfa8f27ebd')

package() {
  cd $srcdir

  install -dm 755 "$pkgdir/usr/lib/node_modules/"
  cd "$pkgdir/usr/lib/node_modules/"
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
