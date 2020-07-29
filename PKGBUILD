# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.125.0
pkgrel=1
pkgdesc="Deploy Kubernetes Helm Charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('helm')

source=("helmfile_linux_amd64_$pkgver::https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('db9f7ce52bfeb2c2a9b68c40de158ce8f64bd602b8048061d56a77deaf450545')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64_$pkgver "$pkgdir/usr/bin/helmfile"
}

