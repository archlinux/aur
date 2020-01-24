# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v1.0.3
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$pkgver
source=($_rke_file::"https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
sha256sums=('736e8c5da16d28f1f32b71f66ff4ae5d0a3ffa9b868589876832f0faaabd93fd')

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
