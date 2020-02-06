# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pptx
_pypiname=${pkgname}
pkgver=0.6.18
pkgrel=1
pkgdesc="Create Open XML PowerPoint documents in Python"
url="https://github.com/scanny/python-pptx"
arch=('any')
license=('MIT')
depends=('python' 'python-behave' 'flake8' 'python-lxml' 'python-mock'
	'python-pyparsing' 'python-pillow' 'python-pytest' 'python-xlsxwriter')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scanny/python-pptx/archive/v${pkgver}.tar.gz")
sha256sums=('f427728c4f5f3a0d28f8d1fb6d2f8c56fe133acf1161cd16083c294e10071bc0')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
