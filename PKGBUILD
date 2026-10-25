pkgname=driftwm-bin
pkgver=0.20.0
pkgrel=1
pkgdesc="Trackpad-first infinite canvas Wayland compositor - Prebuilt binary distribution"
arch=('x86_64')
url="https://github.com/malbiruk/driftwm"
license=('GPL-3.0-or-later')

depends=('libdisplay-info' 'libinput' 'seatd' 'mesa' 'libxkbcommon')

provides=("driftwm=$pkgver")
conflicts=('driftwm')

source=("https://github.com/qofqoflop/driftwm-bin/releases/download/v${pkgver}/driftwm-linux-x86_64.tar.gz")
sha256sums=('043d7cd41b287a259a65962005fb613dc8d866208bac852ea332d29201ab38e7')

package() {
    cp -a "$srcdir/." "$pkgdir/"
}
