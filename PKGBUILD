# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=0.6
pkgrel=0
pkgdesc="python script for getting stock quotes from yahoo and calculting gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy' 'python-colorama')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote.py")
md5sums=('db3d97dc7b13e8424a1a4ade7e75e89f')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote.py" "$pkgdir/usr/bin/"
}
