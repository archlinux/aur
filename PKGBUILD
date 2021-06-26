# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Contributor:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=pomerium-bin
pkgver=0.14.6
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
sha256sums_x86_64=('922e0fe1b13d70ad5127fdb68206b36e0386476e7aae1949dc54e987ba6bfbd0')
sha256sums_aarch64=('a236ff1159db26f288824c0495090917c614f70dc2238abf229cc91d7e9c548e')

package() {
	install -Dm755 "${srcdir}/pomerium" -t "${pkgdir}/usr/bin"
}
