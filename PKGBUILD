# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.13.3
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
source=("https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('864f95477c21c845da656b405fe51cdeb6015e85d5755b76dae1dd1112d3f906')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
