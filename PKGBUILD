# Maintainer: BowDown097 <bowdown097 at sneed dot church>

pkgname=nordvpn-dinit
pkgver=20240301
pkgrel=2
pkgdesc="dinit service script for nordvpn-bin"
arch=('any')
url="https://nordvpn.com/download/linux/"
license=('GPL3')
depends=('dinit' 'nordvpn-bin' 'shadow')
source=('nordvpnd' 'nordvpnd.script')
sha256sums=('75027a88b1ce2e928397dc6116d0b882a186faf025a08c8950fb438af246054d'
            '28bde36755daf407f0afe1670e8a9ca430c15b7cdd3d5411f92c5dd6670be900')

package() {
    install -Dm644 "$srcdir/nordvpnd" "$pkgdir/etc/dinit.d/nordvpnd"
    install -Dm755 "$srcdir/nordvpnd.script" "$pkgdir/usr/lib/dinit/nordvpnd"
}
