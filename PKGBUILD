# Maintainer: Daniel Gadd <aur@gadd.co.nz>

pkgname=pluto-bin
pkgver=4.0.0
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('fc4e828a5cf6cd1cb062d7f739b4bae172f32834cc71547f568e37233b1a29a3')

package() {
  install -Dm 755 "$srcdir/pluto" "$pkgdir/usr/bin/pluto"
}
