# Maintainer: Hyper Focus <hyperfocusedblur@proton.me>
pkgname=xray-dinit
pkgver=1.0.0
pkgrel=1
pkgdesc="Dinit service definition for Xray-core"
url="https://github.com/XTLS/Xray-core"
arch=('any')
license=('unknown')
depends=('xray' 'dinit')
# makedepends=()
# checkdepends=()
# optdepends=()
source=('xray.dinit-service')
backup=('etc/dinit.d/xray')
sha256sums=('SKIP')

package() {
   install -Dm644 "$srcdir/xray.dinit-service" "$pkgdir/etc/dinit.d/xray"
}
