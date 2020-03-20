# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=0.3.2
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl=$pkgver')
source=("https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('6864b34dddc7c5fccf6ecf72d2f50efb4a61e75277f6883dbbece36955c92ccd')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64" "$pkgdir/usr/bin/clusterctl"
}

