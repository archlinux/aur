pkgname=socks-relay
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple socks5 server and relay"
arch=(x86_64)
url="https://github.com/guillon/socks-relay"
license=('MIT')
depends=('python-pysocks')
source=("https://github.com/guillon/socks-relay/archive/refs/tags/v${pkgver}.zip")
sha256sums=('59e02359aa61caab1ff4504df64da91d1a43eea419479d82ed530fef26ffb58a')

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install -Dm755 $srcdir/socks-relay-${pkgver}/socks-relay.py "${pkgdir}/usr/bin/socks-relay"
}
