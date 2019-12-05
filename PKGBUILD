# Maintainer: Peter Trotman <${firstname}${lastname}@gmail.com>

pkgname='zecwallet'
pkgver=0.8.1
pkgrel=1
pkgdesc='A z-Addr first full node and UI wallet for zcash'
arch=('x86_64')
url='https://github.com/ZcashFoundation/zecwallet'
license=('MIT')
groups=()
depends=()
makedepends=()
optdepends=()
provides=(
    'zecwallet'
    'zcashd'
    'zcash-cli'
)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "https://github.com/ZcashFoundation/zecwallet/releases/download/v$pkgver/linux-binaries-$pkgname-v$pkgver.tar.gz"
)
noextract=()
md5sums=()
sha256sums=(
    '4c3aa6517ff16b1df037bc84ec4a325877e0604f24cd208251cacc52fe56359b'
)
package() {
    DESTDIR="${pkgdir}/usr/bin"
    cd "${pkgname}-v${pkgver}"
    install -Dm755 zecwallet "$DESTDIR/zecwallet"
    install -Dm755 zcashd "$DESTDIR/zcashd"
    install -Dm755 zcash-cli "$DESTDIR/zcash-cli"
}
