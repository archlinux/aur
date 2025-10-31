# Maintainer: hyslee <hyslee at hyunsoolee dot net>

pkgname=ivpn-dinit
pkgver=1
pkgrel=1
pkgdesc="dinit service for ivpn"
arch=('any')
license=('GPL-3.0')
depends=(ivpn)
optdepends=('ivpn-ui')
source=('ivpn')
sha256sums=('6b398337aefe18bdfa075eab4c2004a8b19677ab3325f61c28a2da26881d1420')

package() {
    install -Dm644 ivpn "$pkgdir/etc/dinit.d/ivpn"
}
