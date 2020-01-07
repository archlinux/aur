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
md5sums=('94b63f946fc50360b7e60daab0696c2e')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
