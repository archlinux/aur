# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pptx
_pypiname=${pkgname}
pkgver=0.6.19
pkgrel=1
pkgdesc="Create Open XML PowerPoint documents in Python"
url="https://github.com/scanny/python-pptx"
arch=('any')
license=('MIT')
depends=('python' 'python-behave' 'flake8' 'python-lxml' 'python-mock'
	'python-pyparsing' 'python-pillow' 'python-pytest' 'python-xlsxwriter')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://github.com/scanny/python-pptx/archive/v${pkgver}.tar.gz")
sha256sums=('116b24237ecb12a831699fd784dbac947b8bee6c27f99262a0207f6fccb7c9e4')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
