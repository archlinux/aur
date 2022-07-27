# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.18.0
pkgrel=1
pkgdesc='CLI component for Pomerium'
arch=('x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/pomerium/cli"
license=('Apache')
provides=('pomerium-cli')
conflicts=('pomerium-cli')
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-amd64.tar.gz")
source_armv6h=("${pkgname}-${pkgver}-armv6h.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-armv6.tar.gz")
source_armv7h=("${pkgname}-${pkgver}-armv7h.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-armv7.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v${pkgver}/pomerium-cli-linux-arm64.tar.gz")
sha256sums_x86_64=('2975d5239d2e2c6364ce3f72304a13cbc0093b2363bdee8da94c156d4330e25c')
sha256sums_armv6h=('fb2e2f173d092c0cad9aecf9d74943e159eef625f01ef746a2133b20120333fb')
sha256sums_armv7h=('5e17b267753fd347c94bf976669dd74de43e6678b2bf5c01de0130b8212936c0')
sha256sums_aarch64=('8d532fc8e2695430cd42f579f3e94efbe6fde723ed4156bfd8ed866db79e003c')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
