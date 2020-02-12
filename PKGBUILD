# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
source=("https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_Linux_x86_64.tar.gz")
sha256sums=('f7d3facd25e46aaf6b2e44260e1f1486477f6ad952b9d3950e325392a22ab62b')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
