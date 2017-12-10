# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=applicationinsights
pkgname=python-$_name
pkgver=0.11.1
pkgrel=1
pkgdesc="Application Insights SDK for Python"
arch=('any')
url="https://github.com/Microsoft/ApplicationInsights-Python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Microsoft/ApplicationInsights-Python/archive/v${pkgver}.tar.gz")
md5sums=('3964d81cf316b4193e8aa855fc65b7b1')

build() {
  cd "ApplicationInsights-Python-$pkgver"
  python setup.py build
}

package() {
  cd "ApplicationInsights-Python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
