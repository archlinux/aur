# Maintainer: Bartek Laskowski <bartek at undg dot dev>

pkgname=pulse-remote-desktop
pkgver=1.0.17
pkgrel=1
pkgdesc="Electron desktop wrapper for pulse-remote-web - remote PulseAudio/PipeWire controller"
arch=('x86_64')
url="https://github.com/undg/pulse-remote-desktop"
license=('MIT')
optdepends=('pulse-remote: local PulseAudio/PipeWire server (stable)'
	'pulse-remote-git: local PulseAudio/PipeWire server (git)')
options=(!strip !debug)
source=("$pkgname-$pkgver::https://github.com/undg/pulse-remote-desktop/releases/download/v$pkgver/$pkgname")
sha256sums=('952817f50ddcdf710817c2c31c9524188a1c10dffcc3fc6753fa5bb93de546a9')

package() {
	install -Dm755 "$srcdir/$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
}
