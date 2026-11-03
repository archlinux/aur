# Maintainer: Ceaser Larry <ceaser.larry@gmail.com>
pkgname=beads-viewer-bin
pkgver=0.26.0
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
sha256sums_x86_64=('e9f52cda29bb074b166e7c89a3af075fa506e29734085bc4b55348b8a4aab4f1')

source_aarch64=("https://github.com/Dicklesworthstone/beads_viewer/releases/download/v${pkgver}/bv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('1fa1c8234a4db6ad6c930ef8bfd8819784041ddb206c232d3103bd2f2a3f8a3f')

package() {
    cd "${srcdir}"

    install -Dm755 bv "${pkgdir}/usr/bin/bv"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
