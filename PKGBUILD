# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=mermaid-rs-renderer-bin
pkgver=0.2.1
pkgrel=1
pkgdesc='Fast native Mermaid diagram renderer, no browser required'
arch=('x86_64')
url='https://github.com/1jehuang/mermaid-rs-renderer'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('mermaid-rs-renderer' 'mmdr')
conflicts=('mermaid-rs-renderer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/mmdr-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('84ce1c77f0969a9665b355656048216fe1b2d712f44ae168a83f6d9acb260292')

package() {
    install -Dm755 mmdr "${pkgdir}/usr/bin/mmdr"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/1jehuang/mermaid-rs-renderer/blob/main/LICENSE
EOF
}
