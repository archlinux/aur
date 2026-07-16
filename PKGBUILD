pkgname=rudo-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
options=(!strip)
source=("rudo-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/releases/download/v${pkgver}/rudo-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('d4d3e1b239e25ae1f3d739341e8555adb2f799665aa856efc306a3e92e08fb03')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
