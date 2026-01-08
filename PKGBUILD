# Maintainer: BowDown097 <bowdown097 at sneed dot church>

pkgname=adguardhome-dinit
pkgver=20260107
pkgrel=1
pkgdesc="dinit service script for adguardhome"
arch=('any')
url="https://github.com/AdguardTeam/AdGuardHome"
license=('GPL3')
depends=('adguardhome' 'dinit')
source=('adguardhome')
sha256sums=('26cd31901e6744c574b593d4f6477e83d8ad64920eebd19b70bea82d44dba894')

package() {
    install -Dm644 "$srcdir/adguardhome" "$pkgdir/etc/dinit.d/adguardhome"
}
