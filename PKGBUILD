# Maintainer: Firas Zaidan
pkgname=elm-test
pkgver=0.19.1
pkgrel=1
pkgdesc="Run elm-test suites."
arch=(any)
url="https://github.com/rtfeldman/node-test-runner#readme"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=(1507b7aa8f6605f04b474bf9d765f187d24ec5da)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

