# Maintainer: Xuanwo <xuanwo.cn#gmail.com>

pkgname=elvish-bin
pkgver=0.11
pkgrel=1
pkgdesc="A friendly and expressive Unix shell."
arch=('x86_64')
url="https://github.com/elves/elvish"
license=('custom:2-clause BSD')
provides=('elvish')
depends=('glibc')
source=("https://dl.elvish.io/elvish-linux-amd64-${pkgver}.tar.gz")
sha256sums=('a4e04feb2c18fe5996aa4f93951a84c9b7d97025c7d530230c2ea8e24503a637')
install=elvish.install

package() {
    # binary
    install -Dm755 elvish-linux-amd64-${pkgver}  "${pkgdir}/usr/bin/elvish"
    # LICENSE
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
