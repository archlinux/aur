# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=1.2.4
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("clusterctl-linux-amd64-v$pkgver::https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('e54b8893fec3a444ecd81434b1ccadc2dc8811446e3c877c097eb67fd4558bc1')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64-v$pkgver" "$pkgdir/usr/bin/clusterctl"
}

