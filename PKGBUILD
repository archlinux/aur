# Maintainer: 悠远的天穹 vastSky2006@outlook.com

pkgname=xauth
pkgver=0.1.0
pkgrel=1
pkgdesc="Lightweight PolicyKit GUI authentication agent"
arch=('x86_64')
url="https://gitee.com/vastSky2006/xauth"
license=('LGPL-3.0')
depends=('qt6-base' 'polkit-qt6')

source=("$url/releases/download/v$pkgver/xauth-v$pkgver")
sha256sums=('60f7e087592bb5d1ac6147261625805db19a1d085e088641d2428ba051646aa6')

package() {
    install -Dm755 "$srcdir/xauth-v$pkgver" "$pkgdir/usr/bin/xauth"
}