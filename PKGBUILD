# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
# Prebuilt with RUSTFLAGS="-C target-cpu=x86-64-v3" -- targets x86-64-v3 microarchitecture
# (Haswell/Excavator and newer).
pkgname=cksk-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Server-monitor boards for a clck kiosk display (prebuilt, x86-64-v3)"
arch=('x86_64')
url="https://github.com/corbet-labs/cksk"
license=('LicenseRef-FSL-1.1-ALv2')
depends=()
provides=('cksk')
conflicts=('cksk')
source=("https://github.com/corbet-labs/cksk/releases/download/v${pkgver}/cksk-${pkgver}-x86_64-v3.tar.gz")
sha256sums=('2c2cf0474065596a87cc2d235ef3ade97636dce0fb6381b2ad94af7af882696a')

package() {
    install -Dm755 cksk "$pkgdir/usr/bin/cksk"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
