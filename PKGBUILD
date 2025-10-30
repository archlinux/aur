# Maintainer: VC365
pkgname=volume-pulse
pkgver=0.2.9
pkgrel=3
pkgdesc="a lightweight volume control applet utility for Linux"
arch=('x86_64')
url="https://github.com/VC365/volume-pulse"
license=('GPL-3.0-or-later')
depends=('pulseaudio' 'libnotify' 'gtk2')
makedepends=('git')
optdepends=('pavucontrol: For mixer functionality')
source=("https://github.com/VC365/volume-pulse/releases/download/v$pkgver/volume-pulse_v$pkgver.tar.xz")
sha256sums=('0c299019f983ba583a54ea05cc8e607dbeb424bb1d84943987e96e2aa4877e41')

package() {
  cd "$srcdir"
	  install -Dm755 bin/volume-pulse "$pkgdir"/usr/bin/volume-pulse
}

