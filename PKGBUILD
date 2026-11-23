# Maintainer: Ceaser Larry <ceaser.larry@gmail.com>
pkgname=beads-viewer-bin
pkgver=0.28.0
pkgrel=1
pkgdesc="Graph-aware TUI for the Beads issue tracker: PageRank, critical path, kanban, dependency DAG visualization, and robot-mode JSON API"
arch=('x86_64' 'aarch64')
url="https://github.com/Dicklesworthstone/beads_viewer"
license=('MIT-OpenAI-Anthropic-Rider')
provides=('beads-viewer')
conflicts=('beads-viewer')
source=("https://raw.githubusercontent.com/Dicklesworthstone/beads_viewer/v${pkgver}/LICENSE")
sha256sums=('32a82e0a5754e72e51fae44b65a936c831c07376f21c90f5fb9e76897fcc3509')

source_x86_64=("https://github.com/Dicklesworthstone/beads_viewer/releases/download/v${pkgver}/bv_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('6b11b1c652e35b900465e30c59fa5dcd08d289e1bc0e5fee370660c893c34b4b')

source_aarch64=("https://github.com/Dicklesworthstone/beads_viewer/releases/download/v${pkgver}/bv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('6735d36ad9b394f5188d2e8e314a5dd3f6c661966daf534f538fd512f3487c03')

package() {
    cd "${srcdir}"

    install -Dm755 bv "${pkgdir}/usr/bin/bv"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
