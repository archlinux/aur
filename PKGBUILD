# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=kube-dump
pkgver=1.1.1
pkgrel=1
pkgdesc='Backup a Kubernetes cluster as a yaml manifest'
arch=('x86_64')
url='https://github.com/WoozyMasta/kube-dump'
depends=('kubectl' 'jq' 'go-yq')
license=('GPL3')
source=("https://github.com/WoozyMasta/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('64f3fe61cbde6fad57563fc013e34578ff3d84f5a3d267c0b2f6c8fed2a998b7')

package() {
  install -Dm 755 "$srcdir/${pkgname}-${pkgver}/kube-dump" -t "$pkgdir/usr/bin"
}

