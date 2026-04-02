# Maintainer: Bixa <datvu310594 at gmail.com>
# Maintainer: Thien An Dang Thanh <24854119+thienandangthanh at users.noreply.github.com>

pkgname=ibus-vnkey-bin
pkgver=1.0.3c
pkgrel=1
pkgdesc="Vietnamese IME for IBus"
arch=('x86_64')
url="https://github.com/marixdev/vnkey"
license=('GPL')
depends=('ibus')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/marixdev/vnkey/releases/download/v$pkgver/vnkey-ibus-v$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('7394d2fcf834fb4b3daaccb4beda36374750ba6587244b5ae668b32b2ab46002')

package() {
    cp -a "$srcdir/." "$pkgdir/"
    rm -rf "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.INSTALL" 2>/dev/null || true
}
