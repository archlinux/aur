# Maintainer: Ceaser Larry <ceaser.larry@gmail.com>
pkgname=beads-viewer-bin
pkgver=0.29.0
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
sha256sums_x86_64=('772ec0d327a64fe461cf04f140e65df132da3b79d28285e581619685a7ea1888')

source_aarch64=("https://github.com/Dicklesworthstone/beads_viewer/releases/download/v${pkgver}/bv_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('3a58d739f42d1d6ee446afece7376d795190d7c2cd9414a357563a7b62fb57b9')

package() {
    cd "${srcdir}"

    install -Dm755 bv "${pkgdir}/usr/bin/bv"

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
