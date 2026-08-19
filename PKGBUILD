# Maintainer: tee < teeaur at duck dot com >
pkgname=zeptoclaw-bin
pkgver=0.9.2
pkgrel=1
pkgdesc="Fast, small, secure, and local-first personal AI assistant infrastructure"
arch=(x86_64)
url="https://zeptoclaw.com"
license=(Apache-2.0)
depends=(hicolor-icon-theme)
provides=(zeptoclaw)
conflicts=(zeptoclaw)
source=("zeptoclaw-$pkgver-$CARCH.sha256::https://github.com/qhkm/zeptoclaw/releases/download/v$pkgver/zeptoclaw-linux-x86_64.sha256")
source_x86_64=("zeptoclaw-$pkgver-$CARCH::https://github.com/qhkm/zeptoclaw/releases/download/v$pkgver/zeptoclaw-linux-x86_64")
b2sums=('a548795463b3c29cdb10315be5b41b1ee0ad4a1fc343263614d1354172c7bdf8e44370a6d1f9785fe0d5b83fba9b30cc5169f115f1efb2574bd09538098d4960')
b2sums_x86_64=('5d583c74aeb75bb2e3d095ccb77545646c53b939f7ee8c902bce76fd203e8d53e6c5701ea585c9b03fd7f1341cb8f50211aa5d5e179e37862d66510380403bc0')

package() {
  install -Dm755 "zeptoclaw-$pkgver-$CARCH" -t "$pkgdir/usr/bin/"
}
