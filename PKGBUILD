# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.4.5
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
source=("https://github.com/derailed/k9s/releases/download/${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
md5sums=('b087a2b256d0216650e8b8d9c8d0c9c7')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
