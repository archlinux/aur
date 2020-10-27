# Maintainer: Daniel Gadd <aur@gadd.co.nz>

pkgname=pluto-bin
pkgver=3.5.2
pkgrel=1
pkgdesc='A cli tool to help discover deprecated apiVersions in Kubernetes'
arch=(x86_64)
url='https://github.com/FairwindsOps/pluto'
license=(Apache)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FairwindsOps/pluto/releases/download/v$pkgver/pluto_${pkgver}_linux_amd64.tar.gz")
sha256sums=('0ba1f4f945e0f3c8c3e023884987db2489a6ec471da3017f1769128f8d8f4242')

package() {
  install -Dm 755 "$srcdir/pluto" "$pkgdir/usr/bin/pluto"
}