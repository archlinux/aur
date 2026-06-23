# Maintainer: CamelliaTse
# Contributor: CamelliaTse
# GPG Key: 28E1F22CFC60A1BA17B95D11CDEABF16DC0D8711

pkgname=feel
pkgver=1.3.0
pkgrel=1
pkgdesc="记录当前感受的命令行工具"
arch=('any')
url="https://github.com/CamelliaTse/feel"
license=('MIT')
depends=('python')
source=("feel")
sha256sums=('SKIP')
source=('git+https://github.com/Camelliatse/feel.git')

package() {
    install -Dm755 "${srcdir}/feel/feel" "${pkgdir}/usr/bin/feel"
    install -Dm 755 "${srcdir}/feel/feel.1" "${pkgdir}/usr/share/man/man1/feel.1"
}
