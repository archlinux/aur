# Maintainer: Augusto Elesbão <aelesbao@gmail.com>
pkgname=nexus-cli
pkgver=0.3.0
pkgrel=2
pkgdesc="CLI for building Talus Agents with Nexus, the Agentic Workflow Engine"
arch=("x86_64")
url="https://github.com/talus-network/nexus-sdk"
license=("Apache-2.0")

source_x86_64=(
    "$url/releases/download/v$pkgver/nexus-cli-$pkgver-x86_64-unknown-linux-musl.tar.gz"
    "LICENSE"
)

sha256sums_x86_64=(
    '376972a46dab79e8439ac263753ac4ce20da6ed8ecd80ea3566be35ff19c9b88'
    '5ac363bdc786cfc05e937ef3a36c0b47ff25785ab44b80075b1105fcbc494d44'
)

package() {
    install -Dm755 nexus "${pkgdir}/usr/bin/nexus"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
