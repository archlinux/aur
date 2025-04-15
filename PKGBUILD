# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=nexus-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
arch=("x86_64")
url="https://github.com/talus-network/nexus-sdk"
license=("Apache-2.0")

source=("$url/releases/download/v$pkgver/nexus-cli-$pkgver-x86_64-unknown-linux-musl.tar.gz")
sha256sums=("b26290ca239bc9390abd3f15d61aa1ba2452103a12fd042607841645e6b79fa4")

package() {
    install -Dm755 nexus "${pkgdir}/usr/bin/nexus"
    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
