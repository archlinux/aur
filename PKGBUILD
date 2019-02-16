# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v0.1.16
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere. '
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
source=("https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
md5sums=('9ae8e8813e28f51a35ad9343478f2f19')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 rke_linux-amd64 "${pkgdir}/usr/bin/rke"
}
