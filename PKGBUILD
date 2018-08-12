# Maintainer: Graham Smith <gps1539 at gmail dot com>

pkgname=stock_quote
pkgver=1.0.1
pkgrel=1
pkgdesc="python script to get stock quotes and calculate gains and losses"
arch=('any')
license=('GPL')
url='https://github.com/gps1539/stock_quote'
depends=('python' 'python-numpy' 'python-colorama' 'python-influxdb')
makedepends=()
source=("https://raw.githubusercontent.com/gps1539/stock_quote/master/stock_quote/stock_quote")
md5sums=('ec85a98fcb27f6e1608c56ceef3f8aad')

package()
{
   install -d "$pkgdir/usr/bin/"
   install -m755 "stock_quote" "$pkgdir/usr/bin/"
}
