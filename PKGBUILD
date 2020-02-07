# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.13.8
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
source=("https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('6bc889e2af25949969b5c4d2bd74fea428b7a075b57bfe8fbf71216475f588c2')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
