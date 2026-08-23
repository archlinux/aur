# Maintainer: Julian Corbet <julian.corbet@gmail.com>
# Prebuilt with RUSTFLAGS="-C target-cpu=x86-64-v3" -- targets x86-64-v3 microarchitecture
# (Haswell/Excavator and newer).
pkgname=nixwatch-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="Streams the Gatus observability dashboard to nixlock's kiosk display socket (prebuilt, x86-64-v3)"
arch=('x86_64')
url="https://github.com/julian-corbet/nixwatch-corbet-ch"
license=('MIT')
depends=()
provides=('nixwatch')
conflicts=('nixwatch')
source=("https://github.com/julian-corbet/nixwatch-corbet-ch/releases/download/v${pkgver}/nixwatch-${pkgver}-x86_64-v3.tar.gz")
sha256sums=('433b293170c7ba320f4a86b4dc443ef69092113457cf8ce3ca4c2b9053f24c76')

package() {
    install -Dm755 nixwatch-frames "$pkgdir/usr/bin/nixwatch-frames"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
