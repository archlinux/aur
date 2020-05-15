# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Simon Doppler <dop dot simon at gmail dot com>

pkgname=python-dokuwiki
pkgver=1.2.1
pkgrel=1
pkgdesc="Python binding for the dokuwiki rpc"
arch=('any')
url="https://github.com/fmenabe/python-dokuwiki"
license=('custom:MIT')
depends=('python' 'python-setuptools')
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/fmenabe/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('e781dcf81606d73e925fa49b14810fe5ca1b0c9f97f5dec148ed01fad4d5b6e6')

package() {
    cd ${pkgname}-${pkgver}
    python setup.py install --root="$pkgdir"
    install -D "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

