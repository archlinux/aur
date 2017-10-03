# Maintainer: Sávio Costa <saviocmc at protonmail dot com>
pkgname=netctl-ufmg
pkgver=20171003
pkgrel=1
pkgdesc='Example netctl profile for wireless network of Federal University of Minas Gerais'
arch=(i686 x86_64)
url=https://github.com/saviocmc/netctl-ufmg
license=(MIT)
depends=(ca-certificates netctl)
install=install
source=(ufmg)
md5sums=('90302bd0a6fbf7e0bdb3fd0929cd0871')
sha1sums=('c62f9bb4b92dab9a8b9784e2783085d518653215')
sha256sums=('db0fadec983447d9b341b4d955388e40fb5cb3ffb9e8a40f8b277516a14bd7a1')

package() {
  mkdir -p $pkgdir/etc/netctl/examples/
  install -Dm644 ufmg $pkgdir/etc/netctl/examples/
}
