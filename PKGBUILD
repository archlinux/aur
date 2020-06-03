# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v1.1.2
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$pkgver
source=($_rke_file::"https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
sha256sums=('4037709ae20aab7d21ae0bac4ce2c14731f2e0df8f24adbd14b96355eae81231')

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
