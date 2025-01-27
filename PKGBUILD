# Maintainer: Tsiry Sandratraina <tsiry.sndr@fluentci.io>

pkgname=rockbox-zig-bin
pkgver=2025.01.27
pkgrel=1
pkgdesc="Open Source high quality audio player"
arch=('x86_64')
url="https://github.com/tsirysndr/rockbox-zig"
license=('GPL-2.0')
depends=('sdl2' 'libunwind' 'alsa-lib')
source=("$url/releases/download/${pkgver/_/-}/rockbox-zig-${pkgver/_/-}-1-x86_64.pkg.tar.zst")
sha256sums=('fb9aab1cc2459468fa92b36f580ee991308c59c75a28a627e7c12d97e75721d4')

package() {
  bsdtar -xvf "${srcdir}/rockbox-zig-${pkgver}-1-x86_64.pkg.tar.zst" -C "${pkgdir}/"
  rm -f "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.PKGINFO"
}
