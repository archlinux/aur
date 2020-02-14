# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.15.1
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
_k9s_file=k9s-$pkgver.tar.gz
source=($_k9s_file::"https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_Linux_x86_64.tar.gz")
sha256sums=('516798e11bf5f2e54a2a009813781e12e749467ba7a922d74b9d946806ef8083')

package() {
    install -Dm 755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
