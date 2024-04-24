# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=cassowary-bin
pkgver=0.17.0
pkgrel=1
pkgdesc="Modern cross-platform HTTP load-testing tool written in Go "
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/rogerwelin/cassowary"
license=('MIT')

source_aarch64=("cassowary-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_arm64.tar.gz")
source_x86_64=("cassowary-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_x86_64.tar.gz")
source_i386=("cassowary-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_i386.tar.gz")

sha256sums_x86_64=('42dba816b7df6584387a3d60364e8ca2b7352aee02040b5beff9e403d9fe674c')
sha256sums_i386=('42dba816b7df6584387a3d60364e8ca2b7352aee02040b5beff9e403d9fe674c')
sha256sums_aarch64=('42dba816b7df6584387a3d60364e8ca2b7352aee02040b5beff9e403d9fe674c')

provides=('cassowary')

package() {
  install -Dm755 cassowary "${pkgdir}/usr/bin/cassowary"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
