# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=kube-dump
pkgver=1.0.6
pkgrel=2
pkgdesc='Backup a Kubernetes cluster as a yaml manifest'
arch=('x86_64')
url='https://github.com/WoozyMasta/kube-dump'
depends=('kubectl' 'jq' 'yq2-bin')
license=('GPL3')
source=("https://github.com/WoozyMasta/kube-dump/releases/download/v${pkgver}/kube-dump")
sha256sums=('6e239d3cb80de09f56d6408683e7d3a5cc1e8692e25df54998021e533a5040b2')

package() {
  install -Dm 755 "$srcdir/kube-dump" -t "$pkgdir/usr/bin"
}

