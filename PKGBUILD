# Maintainer: Kelsey Maes <kelseymaes at outlook dot com>

_name=applicationinsights
pkgname=python-$_name
pkgver=0.11.6
pkgrel=1
pkgdesc="Application Insights SDK for Python"
arch=('any')
url="https://github.com/Microsoft/ApplicationInsights-Python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Microsoft/ApplicationInsights-Python/archive/v${pkgver}.tar.gz")
sha256sums=('68fa0e65df3b1376d1efac3d035f62fe7137a3109caba548c1c4a46f6960b483')

build() {
  cd "ApplicationInsights-Python-$pkgver"
  python setup.py build
}

package() {
  cd "ApplicationInsights-Python-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
