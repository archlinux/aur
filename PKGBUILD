# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v1.0.0
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere. '
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$pkgver
source=($_rke_file::"https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
md5sums=('d3af41302a37e0e69d5dff7ea1524bcd')

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
