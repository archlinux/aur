# Maintainer: Vincent Shaent <vincentshaent@gmail.com>
# Maintainer: Genki Sky <alt+archlinux.org@genki.is>

pkgname=xsv-bin
pkgver=0.13.0
pkgrel=1
pkgdesc='CSV command line toolkit written in Rust'
arch=('x86_64')
url='https://github.com/BurntSushi/xsv'
license=('MIT')
source=(
    "https://github.com/BurntSushi/xsv/releases/download/$pkgver/xsv-$pkgver-x86_64-unknown-linux-musl.tar.gz"
    'xsv-LICENSE::https://raw.githubusercontent.com/BurntSushi/xsv/master/LICENSE-MIT'
)
sha256sums=('d36b1be0f008d6597c2437e764fbe720eb7557f8980e0b03ca709e1020b5c52b'
            '0f96a83840e146e43c0ec96a22ec1f392e0680e6c1226e6f3ba87e0740af850f')

package() {
    install -D xsv "$pkgdir"/usr/bin/xsv
    install -D -m 0644 xsv-LICENSE "$pkgdir"/usr/share/licenses/xsv/LICENSE
}
