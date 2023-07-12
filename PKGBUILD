# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=('python-lunardate')
pkgdesc="A Chinese Calendar Library in Pure Python"
pkgver=0.2.0
pkgrel=4
url="https://github.com/lidaobing/python-lunardate"
license=('GPLv3')
arch=('any')
depends=('python')
source=("https://pypi.python.org/packages/source/l/lunardate/lunardate-${pkgver}.tar.gz")
md5sums=('ea6a1558ead36a2c0e51d6715dc784c0')

package_python-lunardate(){
    cd "${srcdir}/lunardate-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}

