# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-sdk-python
pkgver=0.9.15
pkgrel=1
pkgdesc='Outscale Python 3 SDK'

arch=('any')
url='https://github.com/outscale/osc-sdk-python'
license=(BSD)

makedepends=('python-pip')
depends=(python-pip python-ruamel-yaml python-requests)

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps https://github.com/outscale/osc-sdk-python/releases/download/0.9.15/osc_sdk_python-0.9.15-py3-none-any.whl
}
