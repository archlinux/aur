# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=django-voting
pkgver=0.2
pkgrel=1
pkgdesc='A generic voting application for Django projects'
arch=('any')
url="https://github.com/jezdez/django-voting/"
license=('BSD')
depends=('python2')
source=("http://pypi.python.org/packages/source/d/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('d4dbc8c0530f127027f6af6e76f91ead')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python2 setup.py install --prefix=/usr --root=$pkgdir --optimize=1
  install -D -m 644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
