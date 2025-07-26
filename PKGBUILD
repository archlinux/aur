# Maintainer: VC365
pkgname=volume-pulse
pkgver=0.2.6
pkgrel=2
pkgdesc="A lightweight volume control applet utility for Linux"
arch=('x86_64')
url="https://github.com/VC365/volume-pulse"
license=('Proprietary')
depends=('pulseaudio' 'libnotify' 'gtk2')
makedepends=('git')
optdepends=('pavucontrol: For mixer functionality')
source=("git+https://github.com/VC365/volume-pulse.git#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/volume-pulse"
  install -Dm755 volume-pulse "$pkgdir/usr/bin/volume-pulse"
}

