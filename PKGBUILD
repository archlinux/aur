# Maintainer : Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-dokuwiki
pkgver=1.1.0
pkgrel=2
pkgdesc="Python binding for the dokuwiki rpc"
arch=('any')
url="https://github.com/fmenabe/python-dokuwiki"
license=('custom:MIT')
depends=('python')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/fmenabe/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('96523bf5326e707ed1cd8c3277685fa2eb9621658b7d0c0ebc2aebce4043053d')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

