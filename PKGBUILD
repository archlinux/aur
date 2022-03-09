# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=1.1.3
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("clusterctl-linux-amd64-v$pkgver::https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('27c1165c45c10ff082ba2b9de635dff9a290a5c527efe715fab81617543987ba')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64-v$pkgver" "$pkgdir/usr/bin/clusterctl"
}

