# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.11.2
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
source=("https://github.com/derailed/k9s/releases/download/${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('3955ee895f5359568bc17225b19b68fea71d8bd7b82cb603f755020d43064d4d')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
