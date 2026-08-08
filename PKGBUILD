# Maintainer: BowDown097 <bowdown097 at sneed dot church>

pkgname=nordvpn-dinit
pkgver=20260807
pkgrel=1
pkgdesc="dinit service script for nordvpn-bin"
arch=('any')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('dinit' 'nordvpn-bin')
source=('nordvpnd' 'nordvpnd.script')
sha256sums=('2963895954e81890bc237be05d52b3dceb0f045c6cd16f757f846840cc179f3c'
            '70a26d3d877d67ea0828f88adca464ac9ab8f17c2aa8043fdb6d3bceea0c1c0b')

package() {
    install -Dm644 "$srcdir/nordvpnd" "$pkgdir/etc/dinit.d/nordvpnd"
    install -Dm755 "$srcdir/nordvpnd.script" "$pkgdir/usr/lib/dinit/nordvpnd"
}
