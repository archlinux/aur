# Maintainer: Victor <victor@xirion.net>

pkgname=rke-bin
pkgver=v0.2.2
pkgrel=1
pkgdesc='Rancher Kubernetes Engine, an extremely simple, lightning fast Kubernetes installer that works everywhere. '
arch=('x86_64')
url='https://github.com/rancher/rke'
license=('Apache')
provides=('rke')
_rke_file=rke-$pkgver
source=($_rke_file::"https://github.com/rancher/rke/releases/download/${pkgver}/rke_linux-amd64")
md5sums=('60a2cff141c3d9e7ef7ef6fb1bb12ba4')

package() {
    install -Dm 755 "$srcdir/$_rke_file" "${pkgdir}/usr/bin/rke"
}
