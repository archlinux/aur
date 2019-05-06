# Maintainer: Lukas Zimmermann <luk.zim91 at gmail dot com>
# Contributor: Kelsey Maes <kelseymaes at outlook dot com>

pkgname=python-applicationinsights
pkgver=0.11.9
pkgrel=1
pkgdesc="Application Insights SDK for Python"
arch=('any')
url="https://github.com/Microsoft/ApplicationInsights-Python"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/Microsoft/ApplicationInsights-Python/archive/v${pkgver}.tar.gz")
sha256sums=('f343ce7fcc43a4732d80b73b5730ee57ace6ff41fd98efc544af7807593a4452')

build() {
  cd "ApplicationInsights-Python-${pkgver}"
  python setup.py build
}

package() {
  cd "ApplicationInsights-Python-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

