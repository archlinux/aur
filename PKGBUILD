# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>

pkgname=zap-bin
pkgver=2.2.1
pkgrel=1
pkgdesc='Delightful AppImage package manager'
arch=('x86_64')
url="https://zap.srev.in"
license=('MIT')
source=("zap::https://github.com/srevinsaju/zap/releases/download/v$pkgver/zap-amd64")
sha256sums=('4972edd5da1be5c5dd2fa14619c7068b09fd9dc31c1feea50ed564cdb14df6bc')

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/zap" "$pkgdir/usr/bin/zap"
}
