# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=sentry
pkgname=python-${_projname}
pkgver=1.0.1
pkgrel=1
pkgdesc='Python monitoring tool'
arch=('any')
url="https://github.com/dopsi/${_projname}"
license=('MIT')
depends=('python-colored')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dopsi/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('6b250aa80d4d7828609c36c338471e68401d1995ac5f8bb595248977b51f3930')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

