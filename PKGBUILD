# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor K1412 <swaelens.jonathan@openmailbox.org>

pkgname="smarty3-gettext"
pkgver=1.6.2
pkgrel=1
pkgdesc="Gettext support for Smarty"
url='https://github.com/smarty-gettext/smarty-gettext'
licence='LGPL'
arch=('any')
depends=('smarty3')
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('06a4c7b7f6745e1227b4b5181d15836f8e0af46a776903c9edd9cda09300ebd4')

package(){
 cd "smarty-gettext-$pkgver"
 install -D -m 644 "block.t.php" "$pkgdir/usr/share/php/smarty3/plugins/block.t.php"
 install -D -m 644 "function.locale.php" "$pkgdir/usr/share/php/smarty3/plugins/function.locale.php"
 install -D -m 755 "tsmarty2c.php" "$pkgdir/usr/bin/tsmarty2c.php"
 gzip -f "tsmarty2c.1"
 install -D -m 644 "tsmarty2c.1.gz" "$pkgdir/usr/man/man1/tsmarty2c.1.gz"
}

