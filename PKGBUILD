# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=sentry
pkgname=python-${_projname}
pkgver=1.0.0
pkgrel=1
pkgdesc='Python monitoring tool'
arch=('any')
url="https://github.com/dopsi/${_projname}"
license=('MIT')
depends=('python-colored')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dopsi/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('b1f6384f2ad9bb40e9bd2f26c2aa5d96764df7ea5a37cb61989b11d0a86e0dd6')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

