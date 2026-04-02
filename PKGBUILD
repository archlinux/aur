# Maintainer: Thien An Dang Thanh <24854119+thienandangthanh at users.noreply.github.com>

pkgname=fcitx5-vnkey-bin
pkgver=1.0.3
pkgrel=1
pkgdesc="Vietnamese IME for Fcitx5"
arch=('x86_64')
url="https://github.com/marixdev/vnkey"
license=('GPL')
depends=('fcitx5')
optdepends=('fcitx-qt5: To run the fcitx unikey macro editor')
source=("$pkgname-$pkgver.pkg.tar.zst::https://github.com/marixdev/vnkey/releases/download/v$pkgver/vnkey-fcitx5-v$pkgver-1-x86_64.pkg.tar.zst")
sha256sums=('ce64c06bc7c0b29af4f5d035209d295e05763569755ea3d072e1a34f0fe54955')

package() {
    cp -a "$srcdir/." "$pkgdir/"
    rm -rf "$pkgdir/.PKGINFO" "$pkgdir/.BUILDINFO" "$pkgdir/.MTREE" "$pkgdir/.INSTALL" 2>/dev/null || true
}
