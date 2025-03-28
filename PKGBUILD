# Maintainer: Your Name <your@email.com>
pkgname=alert
pkgver=1.1
pkgrel=3
pkgdesc="Emergency alarm system with visual and audio alerts"
arch=('any')
url="https://github.com/abinot/alert"
license=('GPL3')
depends=('mplayer' 'alsa-utils' 'sudo')
source=("alert.sh"
        "alert1.mp3")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -Dm755 "$srcdir/alert.sh" "$pkgdir/usr/bin/alert"
    install -Dm644 "$srcdir/alert1.mp3" "$pkgdir/usr/share/alert/alert1.mp3"
}
