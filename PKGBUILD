# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=0.1
pkgrel=1
pkgdesc="python script for getting stock quotes from yahoo and calculting gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote.py")
md5sums=('9f2ce0a313a88dc6cc7d160abfbfde83')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote.py" "$pkgdir/usr/bin/"
}
