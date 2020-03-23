# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v1.0.5
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere.'
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$pkgver
source=($_rke_file::"https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
sha256sums=('06b711acbb1954c118df3db1cd41ac42d4fce4c85f395de3c79086c012a0738b')

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
