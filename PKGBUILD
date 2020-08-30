# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.126.0
pkgrel=1
pkgdesc="Deploy Kubernetes Helm Charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('helm')

source=("helmfile_linux_amd64_$pkgver::https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('2a1352fe25387d2523e7aa37cab129426638be1fb352bd80cf2202dd5cad473e')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64_$pkgver "$pkgdir/usr/bin/helmfile"
}

