# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.16.1
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
_k9s_file=k9s-$pkgver.tar.gz
source=($_k9s_file::"https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_Linux_x86_64.tar.gz")
sha256sums=('9e6e00acd19b7a2a284c16a7c842c3c328fb321d191abc618f0dc2b0d6fbef3e')

package() {
    install -Dm 755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
