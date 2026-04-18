pkgname=rudo-bin
pkgver=0.1.3
pkgrel=1
pkgdesc='Elegant Wayland dock with niri-aware integration'
arch=('x86_64')
url='https://github.com/skorotkiewicz/rudo'
license=('unknown')
depends=('gtk4' 'gtk4-layer-shell')
source=("${repo_name}-${pkgver}.tar.gz::https://github.com/skorotkiewicz/rudo/releases/download/v${pkgver}/${repo_name}-${pkgver}-x86_64-linux.tar.gz")
sha256sums=('af8a1060faa5d31d8eccc8389fdc92143cd252d92393d4917a16aba3917ecd47')

package() {
    install -Dm755 rudo "${pkgdir}/usr/bin/rudo"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${repo_name}/README.md" 2>/dev/null || true
}
