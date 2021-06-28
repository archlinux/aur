# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.14.7
pkgrel=1
pkgdesc='An identity-aware access proxy'
arch=('x86_64' 'aarch64')
url="https://www.pomerium.io"
license=('Apache')
optdepends=('pomerium-cli: CLI component for interacting with server')
provides=('pomerium')
conflicts=('pomerium')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-linux-amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/pomerium/pomerium/releases/download/v${pkgver}/pomerium-linux-arm64.tar.gz")
sha256sums_x86_64=('4c562b69a5bb2b6a00c582853e4b6dce29f94f4a67fd250f37d137b8cf7858e2')
sha256sums_aarch64=('2d0982e5e2e62f68c41d18d036ac86598efe05a62786b00bf04805b8383455ab')

package() {
	install -Dm755 "${srcdir}/pomerium" -t "${pkgdir}/usr/bin"
}
