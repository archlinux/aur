# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='dynwg'
pkgver=1.1.1
pkgrel=1
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'wireguard-tools' 'iputils')
makedepends=('git' 'python' 'python-setuptools')
source=("${pkgname}-${pkgver}::https://github.com/conqp/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('5f59c1b6c4f116c55e9310f0e508a922994aa113c5cc8d29f4cdc1fb0d6641c0')


package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
