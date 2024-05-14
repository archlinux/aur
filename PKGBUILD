# Maintainer: Magnus Refsgaard Christoffersen <magnusrc@protonmail.com>

pkgname=sveltosctl-bin
pkgdesc="Sveltos CLI tool"
pkgver=0.29.1
pkgrel=1
arch=('x86_64')
url="https://projectsveltos.github.io/sveltos/"
license=('Apache')
provides=('sveltosctl')
source=("sveltosctl-linux-amd64::https://github.com/projectsveltos/sveltosctl/releases/download/v$pkgver/sveltosctl-linux-amd64")
sha256sums=("f611d27cadf28b2a119c9119bc051a631f47cea192d15dfcd7685770a52e2048")

package() {
	install -Dm0755 "$srcdir/sveltosctl-linux-amd64" "$pkgdir/usr/bin/sveltosctl"
}
