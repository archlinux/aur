# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>
pkgname=python-adal
pkgver=0.4.5
pkgrel=1
pkgdesc='ADAL for Python'
arch=('any')
url="https://github.com/AzureAD/azure-activedirectory-library-for-python"
license=('MIT')
depends=('python-cryptography' 'python-dateutil' 'python-pyjwt' 'python-requests')
source=("https://github.com/AzureAD/azure-activedirectory-library-for-python/archive/0.4.5.tar.gz")
makedepends=('python-setuptools')
md5sums=('fbd16b5888d775e7c4a38de704b7f2ff')

build() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python setup.py build
}

package() {
  cd "azure-activedirectory-library-for-python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
