# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=catboost-bin
pkgver=1.2.2
pkgrel=1
pkgdesc="CatBoost is a high-performance open source library for gradient boosting on decision trees"
arch=(x86_64 aarch64)
url="https://github.com/catboost/catboost/"
license=(APACHE)
source_x86_64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-${CARCH}-${pkgver}")
b2sums_x86_64=('51bc7c90de1f691f822a684286af9d6ebfa7f3e2e572dd4dd8994f189c6dfb4029fc95f314c910b5dca884ed60f44ecdf441293d32813c1d7c3e2d503f6a595c')
source_aarch64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-${CARCH}-${pkgver}")
b2sums_aarch64=('8a4c61b5b4fe97db9a96d3f44fb46bed8d2f8164f1eb79d43253c6adb4043dfde1673b87d3a3b480db414ba461a00b0f2a2ceb9b36c40ba73f4ed871ff79afe8')

package() {
  install -Dm0755 "catboost-linux-${CARCH}-${pkgver}" "$pkgdir/usr/bin/catboost"
}
