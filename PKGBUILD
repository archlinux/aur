# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='dynwg'
pkgver=1.1.2
pkgrel=1
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools' 'python-setuptools-git' 'wireguard-tools' 'iputils')
makedepends=('git' 'python' 'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('bc351ead1fa107255aea2bcd73d8f532455b62e688547a279e69cef241c5272e')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
