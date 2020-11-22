# Maintainer: Daniel Gadd <aur@gadd.co.nz>

pkgname=fluxv2-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Command line utility for assembling Kubernetes CD pipelines the GitOps way.'
arch=(x86_64)
url='https://github.com/fluxcd/flux2'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v$pkgver/flux_${pkgver}_linux_amd64.tar.gz")
sha256sums=('83f1ef489a2761fea8c08e4d8712fb219b1132c6a56fa9af8bd12a19b0bc8d92')

package() {
  install -Dm 755 "$srcdir/flux" "$pkgdir/usr/bin/flux"
}
