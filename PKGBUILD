# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-dokuwiki
pkgver=1.0.1
pkgrel=2
pkgdesc="Python binding for the dokuwiki rpc"
arch=('any')
url="https://github.com/fmenabe/${_projname}"
license=('custom:MIT')
depends=('python')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/fmenabe/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('4e69705276a1865ee22a3c499f8e322f878c8f1828244904910a45b07d3202ba')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

