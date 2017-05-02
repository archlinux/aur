# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=sentry
pkgname=python-${_projname}
pkgver=1.0.3
pkgrel=1
pkgdesc='Python monitoring tool'
arch=('any')
url="https://github.com/dopsi/${_projname}"
license=('MIT')
depends=('python-colored')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dopsi/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('f00a417de962301d05235f3743275ec9306f3f53bdc2f0374b721669140828b0')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

