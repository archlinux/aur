# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=kube-dump
pkgver=1.1.2
pkgrel=1
pkgdesc='Backup a Kubernetes cluster as a yaml manifest'
arch=('x86_64')
url='https://github.com/WoozyMasta/kube-dump'
depends=('kubectl' 'jq' 'go-yq')
license=('GPL3')
source=("https://github.com/WoozyMasta/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cb7ec47a4b1d4072d1856e4e63fb77dd5eb0416a4db776043cf4cfe262371675')

package() {
  install -Dm 755 "$srcdir/${pkgname}-${pkgver}/kube-dump" -t "$pkgdir/usr/bin"
}

