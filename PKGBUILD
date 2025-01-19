# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=rockbox-zig-bin
pkgver=2025.01.18
pkgrel=1
pkgdesc="Open Source high quality audio player"
arch=('x86_64')
url="https://github.com/tsirysndr/rockbox-zig"
license=('GPL-2.0')
depends=('sdl2' 'libunwind' 'alsa-lib')
source=("$url/releases/download/${pkgver/_/-}/rockbox-zig-${pkgver/_/-}-1-x86_64.pkg.tar.zst")
sha256sums=('8866975ab0120184f1a648064beb2610650f0fd0f815bf8d3609a98fff419787')

package() {
  bsdtar -xvf "${srcdir}/rockbox-zig-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}/"
  rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}