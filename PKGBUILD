# Maintainer: BowDown097 <bowdown097 at sneed dot church>

pkgname=nordvpn-dinit
pkgver=20260107
pkgrel=1
pkgdesc="dinit service script for nordvpn-bin"
arch=('any')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('dinit' 'nordvpn-bin' 'shadow')
source=('nordvpnd' 'nordvpnd.script')
sha256sums=('2963895954e81890bc237be05d52b3dceb0f045c6cd16f757f846840cc179f3c'
            '28bde36755daf407f0afe1670e8a9ca430c15b7cdd3d5411f92c5dd6670be900')

package() {
    install -Dm644 "$srcdir/nordvpnd" "$pkgdir/etc/dinit.d/nordvpnd"
    install -Dm755 "$srcdir/nordvpnd.script" "$pkgdir/usr/lib/dinit/nordvpnd"
}
