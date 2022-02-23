# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.17.0
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
sha256sums_x86_64=('4056240d63d0b11d3cd29be58e95a17f1868efd4c858e6a863ea114a3620cc91')
sha256sums_armv6h=('3e0a014ae1cad9e95cb64795bb08f4103cf1cade2ba93c91aa3e431e3693e03d')
sha256sums_armv7h=('f485ee49fd776f4e0f588a9174586885772f0c37442dc9bece6a16ad3f90eb46')
sha256sums_aarch64=('69abfcc9220ab7010506256ee3a83c289c3c65a5c2ca6e5527adbee502da22a9')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
