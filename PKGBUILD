# Maintainer: Benigno Batista Jr <benignobjunior@gmail.com>
pkgname=mermaid-rs-renderer-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Fast native Mermaid diagram renderer, no browser required'
arch=('x86_64')
url='https://github.com/1jehuang/mermaid-rs-renderer'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=('mermaid-rs-renderer' 'mmdr')
conflicts=('mermaid-rs-renderer')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/mmdr-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('a3f44bec7eefac178d6879966d4d067e0d17dbe5fae4ad2dba66651e5780e483')

package() {
    install -Dm755 mmdr "${pkgdir}/usr/bin/mmdr"
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
MIT License - See https://github.com/1jehuang/mermaid-rs-renderer/blob/main/LICENSE
EOF
}
