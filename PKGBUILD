# Maintainer: Richard Neumann aka. schard <mail at richard dash neumann period de>

pkgname='wgmgr'
pkgver=1.4.8
pkgrel=1
pkgdesc='Manages WireGuard PKIs for VPN-like deployments'
arch=('any')
url="https://github.com/coNQP/${pkgname}"
license=('GPLv3')
depends=('python' 'python-wgtools')
makedepends=('git')
source=("git+${url}.git#tag=${pkgver}")
md5sums=('SKIP')


package() {
    cd "${pkgname}"
    python setup.py install --root "${pkgdir}" --optimize=1
}
