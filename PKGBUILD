# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=nexus-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
arch=("x86_64")
url="https://github.com/talus-network/nexus-sdk"
license=("Apache-2.0")

source=("$url/releases/download/v$pkgver/nexus-cli-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("ed199419840f53bfa899372d4ebd98ed2bfad0a866ee3241b50e7d261f0f07b6")

package() {
    install -Dm755 nexus "${pkgdir}/usr/bin/nexus"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
