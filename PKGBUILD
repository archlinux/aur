# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=pomerium-cli-bin
pkgver=0.14.6
pkgrel=1
pkgdesc='An identity-aware access proxy -- command-line interface'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://www.pomerium.io"
license=('Apache')
provides=('pomerium-cli')
conflicts=('pomerium-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-amd64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6h.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-armv6.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-armv7.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-cli-linux-arm64.tar.gz")
sha256sums_x86_64=('9b7bb47ba86b6d50d0580fe0a2722119125adbea15411b0ff2eefaf4710d27fe')
sha256sums_armv6h=('eb7b2f3dd8cec1f14f10dc2af634802b4ce5db2a538309da4d56e0148a8d2fbe')
sha256sums_armv7h=('35d7047b46d19f4791c8191e4a1c6e08f8c83a9d2b38ebd9de328d028fde0f06')
sha256sums_aarch64=('45e3dda688db53b35fe481d9d82ff21dae94f6121522df28718d477e5ba72737')

package() {
	install -Dm755 pomerium-cli -t "${pkgdir}/usr/bin"
}
