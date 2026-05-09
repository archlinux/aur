# Maintainer: Tsiry Sandratraina <tsiry.sndr@rocksky.app>

pkgname=rockbox-zig-bin
pkgver=2026.05.09
pkgrel=1
pkgdesc="Open Source high quality audio player"
arch=('x86_64')
url="https://github.com/tsirysndr/rockbox-zig"
license=('GPL-2.0')
depends=('libunwind' 'alsa-lib' 'dbus' 'bluez' 'bluez-utils' 'pulseaudio-bluetooth')
source=("$url/releases/download/${pkgver}/rockbox_${pkgver}_x86_64-linux.tar.gz")
sha256sums=('d92b29031582b3cf605eb5f0365dbafade798866eb8ba8b00fdce8eda70bf2be')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  tar xvf "${srcdir}/rockbox_${pkgver}_x86_64-linux.tar.gz" -C "${pkgdir}/usr/bin"
}
