# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.35.0
pkgrel=3
pkgdesc="Helmfile is declarative spec for deploying helm charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('kubernetes-helm')

source=("https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('6e4a2701c9e8213cdaf078c01eb38de388d03b89d9831b5587b83c2f4eeb6c12')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64 "$pkgdir/usr/bin/helmfile"
}

