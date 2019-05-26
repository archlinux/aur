# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='wgmgr'
pkgver=1.2.7
pkgrel=1
pkgdesc='Manages WireGuard PKIs for VPN-like deployments'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-peewee' 'python-pymysql' 'python-wgtools' 'python-peeweeplus')
makedepends=('git')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
