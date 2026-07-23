# Maintainer: Nicholas Georgescu <nsg27@case.edu>

pkgname=i3blocks-timer
pkgver=1.0.0
pkgrel=1
pkgdesc="Countdown timer and stopwatch blocklet for i3blocks"
arch=('any')
url="https://aur.archlinux.org/packages/i3blocks-timer"
license=('MIT')
depends=('i3blocks' 'libnotify' 'libpulse' 'sound-theme-freedesktop')
source=('timer' 'LICENSE')
sha256sums=('a59c933ffadd053e6b416a830d3cc9956836b9000c978462545afcae5d7e0528'
            'c6a073c489f9d81998a1a20d514efd9e8579302eafffb5bc69a86bfa0e6c363f')

package() {
    install -Dm755 "$srcdir/timer" "$pkgdir/usr/lib/i3blocks/timer"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
