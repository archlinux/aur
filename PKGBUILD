# Maintainer: VC365
pkgname=volume-pulse
pkgver=0.2.9
pkgrel=1
pkgdesc="a lightweight volume control applet utility for Linux"
arch=('x86_64')
url="https://github.com/VC365/volume-pulse"
license=('GPL-3.0-or-later')
depends=('pulseaudio' 'libnotify' 'gtk2')
makedepends=('git')
optdepends=('pavucontrol: For mixer functionality')
source=("https://github.com/VC365/volume-pulse/releases/download/v$pkgver/volume-pulse_v$pkgver.tar.xz")
sha256sums=('ac46f47a45500a1421096eacac5d329388a9cb57a43a26fb0b77d22ea08d2013')

package() {
  cd "$srcdir"
	  install -Dm755 bin/volume-pulse "$pkgdir"/usr/bin/volume-pulse
}

