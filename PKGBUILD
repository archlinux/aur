# Maintainer: Firas Zaidan
pkgname=elm-test
pkgver=0.18.7
pkgrel=1
pkgdesc="Run elm-test suites."
arch=(any)
url="https://github.com/rtfeldman/node-test-runner#readme"
license=(MIT)
depends=('nodejs' 'npm' )
optdepends=()
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
sha1sums=(3d6d0c39edb16bb7880d12f4668d10bc62c4ef01)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}

