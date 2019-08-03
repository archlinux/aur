# Maintainer: Alexander Eisele <alexander at eiselecloud dot de>
pkgname=kubedb-cli-bin
pkgver=0.12.0
pkgrel=1
pkgdesc=""
arch=('x86_64')
url="https://kubedb.com/"
license=('Apache')
provides=('kubedb-cli')
source=("https://github.com/kubedb/cli/releases/download/$pkgver/kubedb-linux-amd64")
sha512sums=('fc6fdb6f59776405702b16201be327bcab3563811ace7957b7428e373f951b556f1bc7b7decaf90f0b3750a1d9a80ab4f54c9a7b980e44c51c6ac82724103996')
noextract=()

package() {
  mkdir -p "$pkgdir/usr/bin"
  install --mode=755 kubedb-linux-amd64 $pkgdir/usr/bin/kubedb
}

# vim:set ts=2 sw=2 et:
