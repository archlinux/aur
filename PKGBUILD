# Maintainer: Lian <yichengxin7@gmail.com>
pkgname=lianwall-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Selects wallpapers using the golden angle algorithm, sprinkled with Lian's magic"
arch=('x86_64')
url="https://github.com/Yueosa/lianwall"
license=('MIT')
depends=()
source=("https://github.com/Yueosa/lianwall/releases/download/v$pkgver/lianwall_${pkgver}_linux_x86_64")
sha256sums=('5be9c5f16d3403a1ead55313ffa226a0014a8f8e5bce00d8c7fce929318ed1f1')

package() {
    mkdir -p "$pkgdir"/usr/bin
    install -Dm755 "lianwall_${pkgver}_linux_x86_64" "$pkgdir"/usr/bin/lianwall
}

