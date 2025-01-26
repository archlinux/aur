# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=rockbox-zig-bin
pkgver=2025.01.26
pkgrel=1
pkgdesc="Open Source high quality audio player"
arch=('x86_64')
url="https://github.com/tsirysndr/rockbox-zig"
license=('GPL-2.0')
depends=('sdl2' 'libunwind' 'alsa-lib')
source=("$url/releases/download/${pkgver/_/-}/rockbox-zig-${pkgver/_/-}-1-x86_64.pkg.tar.zst")
sha256sums=('df48ebd4cdc8efbcfdbf0bad384477b4e23e596fbf4d3a8ccac945b0ce0c8322')

package() {
  bsdtar -xvf "${srcdir}/rockbox-zig-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}/"
  rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
