# Maintainer: Anatoly Rugalev <anatoly.rugalev gmail com>

pkgname=kubernetes-helmfile-bin
pkgver=0.36.1
pkgrel=1
pkgdesc="Helmfile is declarative spec for deploying helm charts"
url="https://github.com/roboll/helmfile"
license=('MIT')
arch=('x86_64')
depends=('kubernetes-helm')

source=("https://github.com/roboll/helmfile/releases/download/v$pkgver/helmfile_linux_amd64")
sha256sums=('5fa94c436aa9754ecd54e4d5f236bde0821942ae10d94b53e948e2e334e5ead0')
package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin"
  install -m755 helmfile_linux_amd64 "$pkgdir/usr/bin/helmfile"
}

