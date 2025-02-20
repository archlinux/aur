# Maintainer: Magnus Refsgaard Christoffersen <magnusrc@protonmail.com>

pkgname=sveltosctl-bin
pkgdesc="Sveltos CLI tool"
pkgver=0.48.1
pkgrel=1
arch=('x86_64')
url="https://projectsveltos.github.io/sveltos/"
license=('Apache')
provides=('sveltosctl')
source=("sveltosctl-linux-amd64::https://github.com/projectsveltos/sveltosctl/releases/download/v$pkgver/sveltosctl-linux-amd64")
sha256sums=("2a2bf781c3b9a6eeb4ff0c30dcb2ec41c8aaccc85919ec9036c66c6f534bdbdc")

package() {
  install -Dm0755 "$srcdir/sveltosctl-linux-amd64" "$pkgdir/usr/bin/sveltosctl"
}
