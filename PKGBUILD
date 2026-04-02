# Maintainer: Thien An Dang Thanh <24854119+thienandangthanh at users.noreply.github.com>

pkgname=ibus-vnkey-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Vietnamese IME for Fcitx5"
arch=('x86_64')
url="https://github.com/marixdev/vnkey"
license=('GPL')
depends=('ibus')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/marixdev/vnkey/releases/download/v$pkgver/vnkey-ibus-v$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('be331556295f22595f4bd2cb2048b048273558ed3be7b3b25c60fed5cb13afac')

package() {
    cp -a "$srcdir/." "$pkgdir/"
    rm -rf "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.INSTALL" 2>/dev/null || true
}
