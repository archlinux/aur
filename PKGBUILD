pkgname=autorest
pkgver=3.0.6187
pkgrel=1
pkgdesc='The AutoRest tool generates client libraries for accessing RESTful web services.'
arch=(any)
url='https://github.com/azure/autorest'
license=('MIT')
depends=('nodejs' 'npm')
source=(http://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($npmname-$pkgver.tgz)
sha512sums=('5e4dbba957ec01b9a9f792b1f96c2becb88a970b2816d722c6ee3ab04697091afdcd2fa56490cee74b992d76b664813cff3f5a71ca4db771d376fffd0c793bca')

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/lib/node_modules/
  cd $pkgdir/usr/lib/node_modules/
  npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
}
