# Maintainer: Bartek Laskowski <bartek at undg dot dev>

pkgname=pulse-remote-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Audio mixer for PulseAudio and PipeWire — local desktop app and web UI accessible from any device on your network (pre-built binary)"
arch=('x86_64')
url="https://github.com/undg/pulse-remote"
license=('MIT')
depends=('libpulse' 'electron')
install=pulse-remote-bin.install
options=(!debug)

source=("pulse-remote-${pkgver}-Linux_x86_64.tar.gz::https://github.com/undg/pulse-remote/releases/download/v${pkgver}/pulse-remote_${pkgver}_Linux_x86_64.tar.gz")
sha256sums=('dee0d34a11bfb103269e8ad9d88eabbc50d65da8281272f7032e382ef50ef2cb')

package() {
	tar xf "pulse-remote-${pkgver}-Linux_x86_64.tar.gz" -C "$pkgdir"
}
