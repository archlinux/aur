pkgname=rudo-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('unknown')
depends=('gtk4' 'gtk4-layer-shell')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/releases/download/v${pkgver}/${pkgname}-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('ea39d59065b49f5dba07dc83f0f3cbbeffe972088dbe2d42644abafdf2cb7e83')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md" 2>/dev/null || true
}
