# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.54.0
pkgrel=1
pkgdesc="Deploy Kubernetes Helm Charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('kubernetes-helm-bin')

source=("helmfile_linux_amd64_$pkgver::https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('c105bba7bdf44319afeee9540c5f3090c9a077b9a5b6eeb03ecf825cb74a67b6')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64_$pkgver "$pkgdir/usr/bin/helmfile"
}

