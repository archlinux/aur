# Maintainer: Gareth Hubball <ridecar2@gmail.com>
pkgname=broadcast-ctl-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="CLI for AI-powered per-application noise suppression on PipeWire (pre-built binary)"
arch=('x86_64')
url="https://github.com/londospark/broadcast"
license=('GPL-3.0-or-later')
depends=('pipewire' 'pipewire-pulse')
provides=('broadcast-ctl')
conflicts=('broadcast-ctl' 'broadcast-ctl-git')
source=("https://github.com/londospark/broadcast/releases/download/v${pkgver}/broadcast-ctl"
        "https://raw.githubusercontent.com/londospark/broadcast/v${pkgver}/LICENSE")
sha256sums=('c93af77cab2e6dbfb8171df69978fa3342d1a09715af862b4c5afff6b21eae18'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
  install -Dm755 "$srcdir/broadcast-ctl" "$pkgdir/usr/bin/broadcast-ctl"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
