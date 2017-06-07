_npmname=rollup-watch
pkgname=nodejs-$_npmname
pkgver=4.0.0
pkgrel=1
pkgdesc="Watch files for changes and perform incremental rebuilds with Rollup"
arch=(any)
url="https://github.com/rollup/rollup-watch"
license=('MIT')
depends=('npm')
source=(http://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('736772714eccfc264181faefd736de4f5447d5cf0e1d9df2623a82e4ce625ea5')

package() {
  npm install -g --user root --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
  chmod -R go-w "$pkgdir"/usr
}
