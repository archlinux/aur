# Maintainer: Bixa <datvu310594 at gmail.com>
# Maintainer: Thien An Dang Thanh <24854119+thienandangthanh at users.noreply.github.com>

pkgname=fcitx5-vnkey-bin
pkgver=1.0.3d
pkgrel=1
pkgdesc="Vietnamese IME for Fcitx5"
arch=('x86_64')
url="https://github.com/marixdev/vnkey"
license=('GPL')
depends=('fcitx5')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/marixdev/vnkey/releases/download/v$pkgver/vnkey-fcitx5-v$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('b24b1af1ab48404013482114008443a09fb3ac8a7838f1b2ca59c399375bb456')

package() {
    cp -a "$srcdir/." "$pkgdir/"
    rm -rf "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.INSTALL" 2>/dev/null || true
}
