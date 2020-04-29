# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=0.3.4
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('930542fb60f86d73c475c5c2374631f3afdf22988c628d1dc01d962bae5a65d2')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64" "$pkgdir/usr/bin/clusterctl"
}

