# Maintainer: Bixa <datvu310594 at gmail.com>
# Maintainer: Thien An Dang Thanh <24854119+thienandangthanh at users.noreply.github.com>

pkgname=ibus-vnkey-bin
pkgver=1.0.3d
pkgrel=1
pkgdesc="Vietnamese IME for IBus"
arch=('x86_64')
url="https://github.com/marixdev/vnkey"
license=('GPL')
depends=('ibus')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/marixdev/vnkey/releases/download/v$pkgver/vnkey-ibus-v$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('2da7fe6d95330f4e7d78b5bf66e5aac966a3b0807cd124f5d2348ece291c73fd')

package() {
    cp -a "$srcdir/." "$pkgdir/"
    rm -rf "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.INSTALL" 2>/dev/null || true
}
