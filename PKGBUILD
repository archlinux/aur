# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=0.5
pkgrel=0
pkgdesc="python script for getting stock quotes from yahoo and calculting gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy' 'python-colorama')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote.py")
md5sums=('82311c41412b323731dd71b982d7a552')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote.py" "$pkgdir/usr/bin/"
}
