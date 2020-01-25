# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.13.5
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
source=("https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('0715c375d1408cad920555acdff08d539d2b581e8f9dc7d87fa6ef80fbd0d6fe')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
