# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname=compiledb-generator
pkgver=0.9.2
pkgrel=1
pkgdesc="Tool for generating Clang's JSON Compilation Database files for make-based build systems"
arch=('any')
url='https://github.com/nickdiego/compiledb-generator'
license=('GPLv3')
makedepends=('python-setuptools')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=('27e9df13aee55e1414c73002c93280b09d4cbdcfc1ac01741e460f6c72c3ddb7')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
