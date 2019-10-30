# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.9.3
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
source=("https://github.com/derailed/k9s/releases/download/${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('cb26ba015ef513e8eaf436f7737e9d59')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
