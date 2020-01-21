# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.13.2
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
source=("https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('02b009a0ec12d9ee20aeeb98141724472b41e00345dae9a05cac063f983c2d7a')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
