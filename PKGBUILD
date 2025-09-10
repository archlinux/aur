# Maintainer: 悠远的天穹 vastSky2006@outlook.com

pkgname=vspolkit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight PolicyKit GUI authentication agent"
arch=('x86_64')
url="https://gitee.com/vastSky2006/vspolkit"
license=('LGPL-3.0')
depends=('qt6-base' 'qt6-svg' 'polkit-qt6')

source=("$url/releases/download/v$pkgver/vspolkit-v$pkgver")
sha256sums=('9345ac62d2e2c77b5139ab778e2f21fe0b489991276fb50cabf168d13559b45f')

package() {
    install -Dm755 "$srcdir/vspolkit-v$pkgver" "$pkgdir/usr/lib/vspolkit"
}