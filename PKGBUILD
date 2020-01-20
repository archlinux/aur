# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
source=("https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('9ab42dfbb6abf6a7c959c5027d80992848fd90b5245252950f708d586fde1fc5')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
