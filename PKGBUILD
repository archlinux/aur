# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v1.0.1
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere. '
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$pkgver
source=($_rke_file::"https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
sha256sums=('0175283033c73a308ea870fc0730dc326d6396a5fd3b8160998333d1d53abea4')

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
