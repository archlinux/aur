# Maintainer: Martin Scholz <scholz.m82@gmail.com>
pkgname=python-trytond_account_invoice_secondary_unit
_name=trytond_account_invoice_secondary_unit
pkgver=5.8.1
_pkgdir=5.8
pkgrel=2
pkgbase=python-$_name
pkgdesc="Tryton module to add a secondary unit on invoice line"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6')
makedepends=('python-distribute')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ec60d47cf93629bcd2d43e381ade2a49d991c5498ab6c352ff48c287a0d481cd')
sha512sums=('95416b287b2a3a10816bed12864522842ffee9df4daa61ba5809bcc8b06a373cba9762cfa4d00d11e08c3872fbfa9a40f215fa37b55ba0c5214fe577bba8eb60')
b2sums=('eef91db659d885e713b5c83bc20dc690aeab66e1146a8c1360c1fccf056d0f08932a2a2a876d148118fda31efb7f7b2c96d3e83bfeda2496aa54d6416cd05530')

build() {
  cd $srcdir/$_name-$pkgver
  python setup.py build
}

package() {
  cd $srcdir/$_name-$pkgver
  python setup.py install --root=$pkgdir --optimize=1 --skip-build
}
