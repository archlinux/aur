# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.12.0
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
source=("https://github.com/derailed/k9s/releases/download/${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('2d7fedcf5335fae0569826121f5ff5e6c23122d30685684e0de5b83b65059f9c')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
