# Maintainer: Simon Conseil <contact+aur at saimon dot org>
# Contributor: Michael Louis Thaler <michael.louis.thaler@gmail.com>
# Contributor: Mark Harviston infinull@gmail.com
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
pkgname=jslint
pkgver=0.6.1
pkgrel=1
pkgdesc="Command-line JSLint, installed through npm"
arch=('any')
url="https://github.com/reid/node-jslint"
license=('custom:BSD and modified MIT')
depends=('nodejs')
source=("https://github.com/reid/node-jslint/archive/v$pkgver.tar.gz")
sha256sums=("b1e9fc4f9e17e954c45c2fcae729691e64df1367c322f3451af9cd204f3354c5")

package() {
  cd "$srcdir/node-$pkgname-$pkgver"
  mkdir -p $pkgdir/usr
  npm install --user root -g --prefix="$pkgdir/usr"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
