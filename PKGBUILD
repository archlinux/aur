# Maintainer: VC365
pkgname=volume-pulse
pkgver=0.3.2
pkgrel=1
pkgdesc="a lightweight volume control applet utility for Linux"
arch=('x86_64')
url="https://github.com/VC365/volume-pulse"
license=('GPL-3.0-or-later')
depends=('pulseaudio' 'libnotify' 'gtk2')
makedepends=('git')
optdepends=('pavucontrol: For mixer functionality' 'libfm-gtk2: For lxde support')
source=("https://github.com/VC365/volume-pulse/releases/download/v$pkgver/volume-pulse_v$pkgver.tar.xz")
sha256sums=('bf69fde31d71d5ae23af0f5b5f4d51e08e8efaf023f2014e959f7e3eaebf6301')

package() {
  cd "$srcdir"
	  install -Dm755 bin/volume-pulse "$pkgdir"/usr/bin/volume-pulse
}

