_pkgname=xmrig
pkgname=${_pkgname}-c3-bin
pkgver=6.12.0
pkgrel=1
pkgdesc="Monero cryptocurrency CPU miner, with C3Pool auto alg switching"
arch=('x86_64')
url="https://github.com/C3Pool/xmrig-C3"
license=('GPL')
depends=('glibc')
provides=('xmrig')
conflicts=('xmrig')
replaces=('xmrig')
install=${_pkgname}.install
source=("https://github.com/C3Pool/xmrig-C3/releases/download/v${pkgver}-C3/xmrig-v${pkgver}-C3-linux-Static.tar.gz")

package() {
    install -Dm755 xmrig "${pkgdir}/usr/bin/xmrig"
    install -Dm644 config.json "${pkgdir}/usr/share/doc/xmrig/config.json.example"
}
md5sums=('2d8fd031e9173bd17ede78c83771d9d6')
