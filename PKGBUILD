# Maintainer: Vianney le Clément de Saint-Marcq <code AT quartic·eu>
pkgname=certbot-ovh
pkgver=0.1
pkgrel=1
pkgdesc="OVH DNS Authenticator plugin for Certbot"
arch=('any')
url="https://github.com/vianney/certbot-ovh"
license=('Apache')
depends=('certbot' 'python-ovh')
makedepends=('python-setuptools')
source=("https://github.com/vianney/certbot-ovh/archive/v${pkgver}.tar.gz")
sha256sums=('37f79e0a7d1462a5b86a2459dbfbc6fc21292434f0f195ddcbe4ba16b619e1de')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1
}
