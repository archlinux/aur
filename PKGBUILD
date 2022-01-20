# Maintainer: Dominic Brekau <aur@dominic.brekau.de>

pkgname=kube-dump
pkgver=1.0.7
pkgrel=1
pkgdesc='Backup a Kubernetes cluster as a yaml manifest'
arch=('x86_64')
url='https://github.com/WoozyMasta/kube-dump'
depends=('kubectl' 'jq' 'go-yq')
license=('GPL3')
source=("https://github.com/WoozyMasta/${pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('d120849899ee9154a4c7de1fe20568563ec2712797f29d538192b122a040e46f')

package() {
  install -Dm 755 "$srcdir/${pkgname}-${pkgver}/kube-dump" -t "$pkgdir/usr/bin"
}

