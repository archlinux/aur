# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=catboost-bin
pkgver=1.2.3
pkgrel=1
pkgdesc="CatBoost is a high-performance open source library for gradient boosting on decision trees"
arch=(x86_64 aarch64)
url="https://github.com/catboost/catboost/"
license=(APACHE)
source_x86_64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-${CARCH}-${pkgver}")
b2sums_x86_64=('a91d203516fc1a695cbed564d5a8b5062a3d65406d0fe7783eeb2fb3c4908a644383c5ea5c797915cca31053a2ac4e77048cc64055f1988d133ecceb3e2ef5cf')
b2sums_aarch64=('a91d203516fc1a695cbed564d5a8b5062a3d65406d0fe7783eeb2fb3c4908a644383c5ea5c797915cca31053a2ac4e77048cc64055f1988d133ecceb3e2ef5cf')
source_aarch64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-${CARCH}-${pkgver}")

package() {
  install -Dm0755 "catboost-linux-${CARCH}-${pkgver}" "$pkgdir/usr/bin/catboost"
}
