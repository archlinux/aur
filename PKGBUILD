# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=0.9.0
pkgrel=1
pkgdesc="python script to get stock quotes and calculate gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy' 'python-colorama' 'python-influxdb')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote")
md5sums=('ef41046fd7f1693a2a655b448db96670')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote" "$pkgdir/usr/bin/"
}
