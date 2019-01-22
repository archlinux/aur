# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v0.1.15
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere. '
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
source=("https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
md5sums=('975441c054146764a6574fccbac737ec')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -D -m755 rke_linux-amd64 "${pkgdir}/usr/bin/rke"
}
