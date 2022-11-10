# Maintainer: Jake Leahy <jake (at) lowerCaseLastName (dot) dev

pkgname=cassowary-bin
pkgver=0.16.0
pkgrel=1
pkgdesc="Modern cross-platform HTTP load-testing tool written in Go "
arch=('x86_64' 'i386' 'aarch64')
url="https://github.com/rogerwelin/cassowary"
license=('MIT')

source_aarch64=("cassowary-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_arm64.tar.gz")
source_x86_64=("cassowary-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_x86_64.tar.gz")
source_i386=("cassowary-$pkgver.tar.gz::https://github.com/rogerwelin/cassowary/releases/download/v$pkgver/cassowary_Linux_i386.tar.gz")

sha256sums_aarch64=("2ca161d390eb56bffb36137b6c8c98f308f67b66bcc4c7cfd7578cd26f6e0547")
sha256sums_x86_64=("610c15fac22a09b516b59c6d6e4996a0993cdd8a0c74587f7eee8b7a9f505186")
sha256sums_i386=("f0a640881bfc480e37e2a8eb038be84731484dbf39542ffae1bf9318ae7f5457")

provides=('cassowary')

package() {
  install -Dm755 cassowary "${pkgdir}/usr/bin/cassowary"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
