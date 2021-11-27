# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>

pkgname=django-voting-0.1
_pythonname=django-voting
pkgver=0.1
pkgrel=2
pkgdesc='A generic voting application for Django projects. Version 0.1'
arch=('any')
url="https://github.com/jezdez/django-voting/"
license=('BSD')
depends=('python2')
provides=('django-voting')
conflicts=('django-voting')
source=("https://pypi.python.org/packages/source/${_pythonname::1}/${_pythonname}/${_pythonname}-${pkgver}.tar.gz")

PYTHON='python2'

package() {
  cd "$srcdir/${_pythonname}-${pkgver}"
  $PYTHON setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pythonname}/LICENSE.txt"
}

md5sums=('2b6162cd9b0e888b9cf8e847ecdd56cb')
sha256sums=('7b5f3665559c7606f40bcfac91b134df3a830edb6e0b819921aca08e647b8ba1')
