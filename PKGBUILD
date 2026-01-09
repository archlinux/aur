# Maintainer: Jasmin <jasmin@example.com>
pkgname=bdui-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Real-time TUI visualizer for the beads issue tracker - Kanban, tree view, dependency graph"
arch=('x86_64')
url="https://github.com/assimelha/bdui"
license=('MIT')
depends=('glibc')
provides=('bdui')
conflicts=('bdui')
source=("${pkgname}-${pkgver}::https://github.com/assimelha/bdui/releases/download/v${pkgver}/bdui-linux-x64")
sha256sums=('7fe3bbbeb779c5123041c86327e6766c9a3f1fb83e8a0f5d984b4316a11dccb6')

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/bdui"
}
