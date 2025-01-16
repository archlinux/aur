# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=2.0.14
pkgrel=1
pkgdesc="python script to get stock quotes and calculate gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy' 'python-colorama' 'python-pandas' 'python-plotly')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote/stock_quote")
md5sums=('1d436fadd113e78cbdef97e9d3a10d43')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote" "$pkgdir/usr/bin/"
}
