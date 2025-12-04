# Maintainer: VC365
pkgname=volume-pulse
pkgver=0.3.1
pkgrel=3
pkgdesc="a lightweight volume control applet utility for Linux"
arch=('x86_64')
url="https://github.com/VC365/volume-pulse"
license=('GPL-3.0-or-later')
depends=('pulseaudio' 'libnotify' 'gtk2')
makedepends=('git')
optdepends=('pavucontrol: For mixer functionality')
source=("https://github.com/VC365/volume-pulse/releases/download/v$pkgver/volume-pulse_v$pkgver.tar.xz")
sha256sums=('586ec34d5fee125be08f80df128fdc76ce68e1eb7d9f6dc0677ed2f640568a75')

package() {
  cd "$srcdir"
	  install -Dm755 bin/volume-pulse "$pkgdir"/usr/bin/volume-pulse
}

