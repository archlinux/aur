# Maintainer: Sergey Yakovlev <selfuryon@gmail.com>

pkgname=clusterctl-bin
pkgdesc="Cluster API Tool"
pkgver=0.3.7
pkgrel=1
arch=('x86_64')
url="https://cluster-api.sigs.k8s.io/"
license=('Apache')
optdepends=('kubectl: to manage the cluster')
provides=('clusterctl')
source=("https://github.com/kubernetes-sigs/cluster-api/releases/download/v$pkgver/clusterctl-linux-amd64")
sha256sums=('8d718691f7923584bbd35abc4407758b3fbd216dccc443f160a9412855f02177')

package() {
    install -Dm 755 "$srcdir/clusterctl-linux-amd64" "$pkgdir/usr/bin/clusterctl"
}

