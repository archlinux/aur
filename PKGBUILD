# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.40.3
pkgrel=1
pkgdesc="Helmfile is declarative spec for deploying helm charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('kubernetes-helm-bin')

source=("https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('e0a9c1a1aa4b077e0442124871521d9a55cbda87d345687b02f6c98a6e063522')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64 "$pkgdir/usr/bin/helmfile"
}

