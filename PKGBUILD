# Maintainer: Victor <victor@xirion.net>
pkgname=k9s-bin
pkgver=0.14.0
pkgrel=1
pkgdesc='Kubernetes CLI To Manage Your Clusters In Style!'
arch=('x86_64')
url='https://github.com/derailed/k9s'
license=('Apache')
provides=('k9s')
conflicts=('k9s')
source=("https://github.com/derailed/k9s/releases/download/v${pkgver}/k9s_Linux_x86_64.tar.gz")
sha256sums=('1161a14b979f731421d1316043450f0f6474c4d4156973c1d554a94578efd502')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/k9s" "${pkgdir}/usr/bin/k9s"
}
