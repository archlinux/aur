# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=0.3.5
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('3877f65bc0b5c59fb48ab654d58ac498f9304449dc3795458cc247f0d7d62741')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64" "$pkgdir/usr/bin/clusterctl"
}

