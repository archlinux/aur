pkgname=driftwm-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Trackpad-first infinite canvas Wayland compositor - Prebuilt binary distribution"
arch=('x86_64')
url="https://github.com/malbiruk/driftwm"
license=('GPL-3.0-or-later')

depends=('libdisplay-info' 'libinput' 'seatd' 'mesa' 'libxkbcommon')

provides=("driftwm=$pkgver")
conflicts=('driftwm')

source=("https://github.com/qofqoflop/driftwm-bin/releases/download/v${pkgver}/driftwm-linux-x86_64.tar.gz")
sha256sums=('d28d20b23174451ba2ff149cab6a21c8e745c494a8d1ab735185eceb770689d2')

noextract=('driftwm-linux-x86_64.tar.gz')

package() {
    tar -xzf "$srcdir/driftwm-linux-x86_64.tar.gz" \
        -C "$pkgdir"
}
