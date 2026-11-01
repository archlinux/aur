# Maintainer: Ceaser Larry <ceaser.larry@gmail.com>
pkgname=beads-viewer-bin
pkgver=0.25.2
pkgrel=2
pkgdesc="Graph-aware TUI for the Beads issue tracker: PageRank, critical path, kanban, dependency DAG visualization, and robot-mode JSON API"
arch=('x86_64' 'aarch64')
url="https://github.com/Dicklesworthstone/beads_viewer"
license=('LicenseRef-MIT-OpenAI-Anthropic-Rider')
provides=('beads-viewer')
conflicts=('beads-viewer')
source=("https://raw.githubusercontent.com/Dicklesworthstone/beads_viewer/v${pkgver}/LICENSE")
sha256sums=('32a82e0a5754e72e51fae44b65a936c831c07376f21c90f5fb9e76897fcc3509')

source_x86_64=("https://github.com/Dicklesworthstone/beads_viewer/releases/download/v${pkgver}/bv_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('4c269087af7a0ddef6825609cb4cdf7db0163624d26d7b02030c38c260b1e199')

source_aarch64=("https://github.com/Dicklesworthstone/beads_viewer/releases/download/v${pkgver}/bv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('a57f64b89851adace4f9b954723972f08f29abb5080fc005b3bd0734b6f3ae0e')

package() {
    cd "${srcdir}"

    install -Dm755 bv "${pkgdir}/usr/bin/bv"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
