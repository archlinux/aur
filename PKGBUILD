pkgname=rudo-bin
pkgver=0.1.4
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('unknown')
depends=('gtk4' 'gtk4-layer-shell')
source=("rudo-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/releases/download/v${pkgver}/rudo-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('875af9937af1cf312857f1f7c0484435ab37a7513f7389c14fc0c19c9096e884')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${repo_name}/README.md" 2>/dev/null || true
}
