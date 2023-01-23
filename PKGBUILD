# Maintainer: Daniel Gadd <aur@gadd.co.nz>

pkgname=pluto-bin
pkgver=5.12.0
pkgrel=1
pkgdesc='Pluto is a utility to help users find deprecated Kubernetes apiVersions in their code repositories and their helm releases.'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('f0a85bb84a69142ea90f5e93d2e3c2f98de08534c80ec6d3a3a85c9007db980a')

package() {
  install -Dm 755 "$srcdir/pluto" "$pkgdir/usr/bin/pluto"
}
