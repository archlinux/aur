# Maintainer: Tomasz Zok <tomasz dot zok (at) gmail dot com>
pkgname=python-highs-git
_name=highs
pkgver=1.5.3
pkgrel=1
pkgdesc="A Python thin wrapper around HiGHS solver: linear optimization software"
url=https://github.com/ergo-code/highs
license=(MIT)
arch=(x86_64)
depends=(python python-numpy)
makedepends=(python-pip)
source=(git+https://github.com/ergo-code/highs)
sha256sums=(SKIP)

package() {
    cd "${srcdir}/${_name}"
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps .
}
