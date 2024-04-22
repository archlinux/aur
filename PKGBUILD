# Maintainer: Sergey Mezentsev <thebits@yandex.ru>
pkgname=catboost-bin
pkgver=1.2.5
pkgrel=1
pkgdesc="CatBoost is a high-performance open source library for gradient boosting on decision trees"
arch=('x86_64' 'aarch64')
url="https://github.com/catboost/catboost/"
license=(APACHE)
source_x86_64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-x86_64-${pkgver}")
source_aarch64=("https://github.com/catboost/catboost/releases/download/v${pkgver}/catboost-linux-aarch64-${pkgver}")
b2sums_x86_64=('57f186d6a6d2a390fb647e3db1e71ace5af6c28823c3cd6c1c095448b8dddad90e8eec6e547403349a5d54c4aedf6fbc06dd826540771d00a0f055f1862a42d7')
b2sums_aarch64=('424e5621f25b8fe23f555959406a78ecbc4967e55983ed86944f009df979c04d94b370e9fb331eb3c693b96db3ec54ea831a35148ddb507200743681024011db')

package() {
  install -Dm0755 "catboost-linux-${CARCH}-${pkgver}" "$pkgdir/usr/bin/catboost"
}
