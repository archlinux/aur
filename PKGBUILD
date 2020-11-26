# Maintainer: Daniel Gadd <aur@gadd.co.nz>

pkgname=fluxv2-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Command line utility for assembling Kubernetes CD pipelines the GitOps way.'
arch=(x86_64)
url='https://github.com/fluxcd/flux2'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v$pkgver/flux_${pkgver}_linux_amd64.tar.gz")
sha256sums=('9a14903925b65b54f03e884ee8b63ff1b8bb63a9bac70dedc09b295aa38912ac')

package() {
  install -Dm 755 "$srcdir/flux" "$pkgdir/usr/bin/flux"
}
