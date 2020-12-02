# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='dynwg'
pkgver=1.1.2
pkgrel=2
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-setuptools' 'python-setuptools-git' 'wireguard-tools' 'iputils')
makedepends=('git' 'python' 'python-setuptools')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
sha256sums=('SKIP')


package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
