pkgname=rudo-bin
pkgver=0.1.5
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('unknown')
depends=('gtk4' 'gtk4-layer-shell')
options=(!strip)
source=("rudo-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/releases/download/v${pkgver}/rudo-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('d3246a63902c6dbb21aaf8a9adf6e382196133b78833cf1db949748c2e64d8be')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${repo_name}/README.md" 2>/dev/null || true
}
