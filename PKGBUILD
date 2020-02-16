# Maintainer: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-asset
_pypiname=asset
_pypidir="bf/e9/9db1ecda28adb6c9a9df8af24301290c40996d4a24c26c93cc79ffa6270a"
pkgver=0.6.13
pkgrel=1
pkgdesc="A package resource and symbol loading helper library, for Python"
url="https://pypi.org/project/asset/"
arch=('any')
license=('GPLv3')
depends=('python' 'python-globre' 'python-aadict')
makedepends=('python-setuptools')
source=(${_pypiname}-${pkgver}.tar.gz::"https://files.pythonhosted.org/packages/${_pypidir}/${_pypiname}-${pkgver}.tar.gz")

sha256sums=('ec56cbf77931cb74d063848531db782f6f0fe1272d1f47f322c15efd0fa732ea')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
