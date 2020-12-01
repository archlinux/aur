# Maintainer: Daniel Gadd <aur@gadd.co.nz>

pkgname=fluxv2-bin
pkgver=0.4.2
pkgrel=1
pkgdesc='Command line utility for assembling Kubernetes CD pipelines the GitOps way.'
arch=(x86_64)
url='https://github.com/fluxcd/flux2'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v$pkgver/flux_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f5d82a8d35fcfed8e484078c144879f08f31476d0e59394a7752b6e58be913ac')

package() {
  install -Dm 755 "$srcdir/flux" "$pkgdir/usr/bin/flux"
}
