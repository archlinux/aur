# Maintainer: adamanteye <ada@adamanteye.cc>
pkgname=ttf-sotyr-fangsong
pkgver=0.1.0
pkgrel=1
pkgdesc="聚珍仿宋二号长体的直接复刻项目."
arch=('any')
url='https://github.com/Hulenkius/sotyr'
license=('OFL-1.1')
source=(
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v0.1-beta.tar.gz"
)
sha256sums=(
    '4146ea25eabc00b0debed4b3f86d0913a5fced9ceac782663a0845d5534846de'
)
package() {
    cd sotyr-0.1-beta
    mkdir -p "$pkgdir/usr/share/fonts/TTF"
    install -Dm644 "fonts/SotyrFangsong-Regular.ttf" "$pkgdir/usr/share/fonts/TTF/SotyrFangsong-Regular.ttf"
    install -Dm644 "OFL.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
