# Maintainer: CamelliaTse
# Contributor: CamelliaTse
# GPG Key: 28E1F22CFC60A1BA17B95D11CDEABF16DC0D8711

pkgname=feel
pkgver=2.2.0
pkgrel=1
pkgdesc="记录当前感受的命令行工具"
arch=('any')
url="https://github.com/CamelliaTse/feel"
license=('MIT')
depends=('python')
source=("https://github.com/CamelliaTse/feel/archive/refs/tags/v2.2.0.tar.gz")
sha256sums=('9884d61d081da37b2c124aefc49b12998f87a612cddd24c54d28a6a52d184890')

package() {
    install -Dm755 "${srcdir}/feel-${pkgver}/feel" "${pkgdir}/usr/bin/feel"
}
