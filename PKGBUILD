# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=0.3.16
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('ae45da8b66a0c8150b91edf88015ff45eb7d21e48f95f006dddd366add6c8441')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64" "$pkgdir/usr/bin/clusterctl"
}

