# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=1.1.2
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("clusterctl-linux-amd64-v$pkgver::https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('c465cdc9468948a4203716ee56923000e78d992d3752a93a339faa59e8eab31d')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64-v$pkgver" "$pkgdir/usr/bin/clusterctl"
}

