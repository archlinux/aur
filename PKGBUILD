# Maintainer: Matthias gatto <matthias.gatto@outscale.com>
# Reference: PKGBUILD(5)

pkgname=osc-sdk-python
pkgver=0.26.0
pkgrel=1
pkgdesc='Outscale Python 3 SDK'

arch=('any')
url='https://github.com/outscale/osc-sdk-python'
license=(BSD)

makedepends=('python-pip')
depends=(python-pip python-ruamel-yaml python-requests)

package() {
	PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps https://files.pythonhosted.org/packages/27/75/428b2a881bb48ed82e39ea68326a93af5e4a87bef00105ff8931b51e3b27/osc_sdk_python-0.26.0-py3-none-any.whl
}
