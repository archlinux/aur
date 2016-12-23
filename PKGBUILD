# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=0.7.3
pkgrel=1
pkgdesc="python script to get stock quotes and calculate gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy' 'python-colorama')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote.py")
md5sums=('4ee384218bbc873e6770dd315c7984e8')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote.py" "$pkgdir/usr/bin/"
}
