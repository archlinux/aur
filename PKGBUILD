# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=catboost-bin
pkgver=1.2.10
pkgrel=1
pkgdesc="CatBoost is a high-performance open source library for gradient boosting on decision trees"
arch=('x86_64' 'aarch64')
url="https://github.com/catboost/catboost/"
license=(APACHE)
source_x86_64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-x86_64-${pkgver}")
source_aarch64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-aarch64-${pkgver}")
b2sums_x86_64=('a976d09c6f2ea37688d72ce1f973bd69a61454797aacaa30f485c103373677cecdab3e73a8595707bad5e4e44ce79a3143ebdcdaa6ae62eb327d56c63215b0ad')
b2sums_aarch64=('84ffae5f874f10913375c12b09e138fd1f80f3fb4fd9d6e808134dd38e284b26789f09aa69f10a7b2c607e0d715e48874887c56aa449fd9db076902d8eaa0eaf')

package() {
  install -Dm0755 "catboost-linux-${CARCH}-${pkgver}" "$pkgdir/usr/bin/catboost"
}
