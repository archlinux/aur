# Maintainer: Jonas Franz <email at jfdev dot de>
pkgver=0.1.3
pkgname=ts2kt
pkgver=0.1.3
pkgrel=1
pkgdesc="Converter of TypeScript definition files to Kotlin declarations"
arch=(any)
url="https://github.com/Kotlin/ts2kt"
license=(Apache-2.0)
depends=('nodejs' 'npm')
optdepends=()
source=(https://registry.npmjs.org/ts2kt/-/ts2kt-$pkgver.tgz)
noextract=(ts2kt-$pkgver.tgz)
sha1sums=(91f566839d319de2dee4d25065573cce81be6abf)

package() {
  cd $srcdir
  local _npmdir="$pkgdir/usr/lib/node_modules/"
  mkdir -p $_npmdir
  cd $_npmdir
  npm install -g --prefix "$pkgdir/usr" ts2kt@$pkgver
}

# vim:set ts=2 sw=2 et:
