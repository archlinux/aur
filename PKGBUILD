# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

_projname=sentry
pkgname=python-${_projname}
pkgver=1.0.2
pkgrel=1
pkgdesc='Python monitoring tool'
arch=('any')
url="https://github.com/dopsi/${_projname}"
license=('MIT')
depends=('python-colored')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/dopsi/${_projname}/archive/v${pkgver}.tar.gz")
sha256sums=('d450f5406cb522f1e066d34355b9d685714bee074d2b5f3045da975ea0b92d8b')

package() {
    cd ${_projname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

