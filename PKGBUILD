# Maintainer: Magnus Refsgaard Christoffersen <magnusrc@protonmail.com>

pkgname=sveltosctl-bin
pkgdesc="Sveltos CLI tool"
pkgver=0.30.0
pkgrel=1
arch=('x86_64')
url="https://projectsveltos.github.io/sveltos/"
license=('Apache')
provides=('sveltosctl')
source=("sveltosctl-linux-amd64::https://github.com/projectsveltos/sveltosctl/releases/download/v$pkgver/sveltosctl-linux-amd64")
sha256sums=("f7ba86ffbf7134029855c41bd81aed4a0068104e9fd4c56e6c1b2962b2206737")

package() {
	install -Dm0755 "$srcdir/sveltosctl-linux-amd64" "$pkgdir/usr/bin/sveltosctl"
}
