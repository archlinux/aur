# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=nexus-cli
pkgver=0.5.0
pkgrel=1
pkgdesc="CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
arch=("x86_64")
url="https://github.com/talus-network/nexus-sdk"
license=("Apache-2.0")

source_x86_64=("$url/releases/download/v$pkgver/nexus-cli-$pkgver-x86_64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('bfcd71ff6965b854162927f6d14aba4abdd47ea1c33d7dc067b0fe90b472e33b')

package() {
    install -Dm755 nexus "${pkgdir}/usr/bin/nexus"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
