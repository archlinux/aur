# Maintainer: VC365
pkgname=volume-pulse
pkgver=0.3.1
pkgrel=2
pkgdesc="a lightweight volume control applet utility for Linux"
arch=('x86_64')
url="https://github.com/VC365/volume-pulse"
license=('GPL-3.0-or-later')
depends=('pulseaudio' 'libnotify' 'gtk2')
makedepends=('git')
optdepends=('pavucontrol: For mixer functionality')
source=("https://github.com/VC365/volume-pulse/releases/download/v$pkgver/volume-pulse_v$pkgver.tar.xz")
sha256sums=('2feefbf36583467e741f1c172d5b9b1631c3d1cc7cb486c775d9de5e8ebc80c6')

package() {
  cd "$srcdir"
	  install -Dm755 bin/volume-pulse "$pkgdir"/usr/bin/volume-pulse
}

