# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='dynwg'
pkgver=1.1.0
pkgrel=1
pkgdesc='A DynDNS watchdog for WireGuard over systemd-networkd'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'wireguard-tools' 'iputils')
makedepends=('git' 'python' 'python-setuptools' 'python-setuptools-git')
source=("${pkgname}::git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
