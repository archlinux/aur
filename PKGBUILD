# Maintainer: Magnus Refsgaard Christoffersen <magnusrc@protonmail.com>

pkgname=sveltosctl-bin
pkgdesc="Sveltos CLI tool"
pkgver=0.45.0
pkgrel=1
arch=('x86_64')
url="https://projectsveltos.github.io/sveltos/"
license=('Apache')
provides=('sveltosctl')
source=("sveltosctl-linux-amd64::https://github.com/projectsveltos/sveltosctl/releases/download/v$pkgver/sveltosctl-linux-amd64")
sha256sums=('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855')

package() {
  install -Dm0755 "$srcdir/sveltosctl-linux-amd64" "$pkgdir/usr/bin/sveltosctl"
}
sha256sums=('1835e1d354915bc64e12db519e19843745805d4ce1edf0af9abb00ec7a37a203')
