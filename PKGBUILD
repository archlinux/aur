# Maintainer: Daniel Gadd <aur@gadd.co.nz>

pkgname=fluxv2-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='Command line utility for assembling Kubernetes CD pipelines the GitOps way.'
arch=(x86_64)
url='https://github.com/fluxcd/flux2'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/fluxcd/flux2/releases/download/v$pkgver/flux_${pkgver}_linux_amd64.tar.gz")
sha256sums=('5a25ee860c425047b20fb69e4753e71fb5aec49584128e183a27113e7bb7cdec')

package() {
  install -Dm 755 "$srcdir/flux" "$pkgdir/usr/bin/flux"
}
