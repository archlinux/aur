# Maintainer: Sávio Costa <saviocmc at protonmail dot com>
pkgname=netctl-ufmg
pkgver=20171117
pkgrel=1
pkgdesc='Example of a netctl profile for the wireless network of the Federal University of Minas Gerais'
arch=('any')
url=https://github.com/saviocmc/netctl-ufmg
license=(MIT)
depends=(netctl)
install=install
source=(ufmg)
md5sums=('0d329b812ba97c35f3abf30950fbf616')
sha1sums=('9f32260cc9681c93d93ff8efca43aa43b0de839c')
sha256sums=('c082e17b188c87efeb2f7612fee769ed1f54a560ce478d889e0c6c464b977315')

package() {
  mkdir -p $pkgdir/etc/netctl/examples/
  install -Dm644 ufmg $pkgdir/etc/netctl/examples/
}
