# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=python-dateparser
pkgver=0.6.0
pkgrel=1
pkgdesc="python parser for human readable dates"
url="https://github.com/scrapinghub/dateparser"
arch=('any')
license=('custom:bsd')
depends=('python-dateutil' 'python-regex' 'python-tzlocal' 'python-ruamel-yaml')
source=(${pkgname#python-}-$pkgver.tar.gz::https://github.com/scrapinghub/dateparser/archive/v0.6.0.tar.gz)
md5sums=('106941579871baa7127b13d6de357a65')

package() {
  cd ${pkgname#python-}-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
