# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=0.7.1
pkgrel=0
pkgdesc="python script to get stock quotes and calculate gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy' 'python-colorama')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote.py")
md5sums=('7083e81fe4dd1fe4c43ce444a4c991a2')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote.py" "$pkgdir/usr/bin/"
}
