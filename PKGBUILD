# Maintainer: sh0rez <me@shorez.de>

pkgname=kubectl-neat-diff
pkgver=0.1.0
pkgrel=0
pkgdesc='De-clutter your kubectl diff output using kubectl-neat'
arch=('x86_64')

url='https://github.com/sh0rez/kubectl-neat-diff'
license=('Apache')
source=("kubectl-neat-diff-$pkgver::https://github.com/sh0rez/kubectl-neat-diff/releases/download/v${pkgver}/kubectl-neat-diff-linux-amd64")

depends=('kubectl')

provides=(kubectl-neat-diff)

package() {
  install -Dm 755 "$srcdir/kubectl-neat-diff-$pkgver" "$pkgdir/usr/bin/kubectl-neat-diff"
}

sha256sums=('36205e3c8eb1554df67a447e554859d9bdb6e459d0aa5e7c7242671270bcd6c4')
