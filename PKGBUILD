# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.20.0
pkgrel=3
pkgdesc="Helmfile is declarative spec for deploying helm charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('kubernetes-helm')

source=("https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('af4107df13012e094ae0a09ec28952212477517aef4ab3720de42e12833a896a')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64 "$pkgdir/usr/bin/helmfile"
}

