# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.19.0
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
sha256sums_x86_64=('c8425667975d14a35ea52a1a3b25edb100b2458aca1e8d0adbf692287d133a65')
sha256sums_armv6h=('183f0f868e6154961b258fd373928d97b77b071321382d182df59e5c6ff7289e')
sha256sums_armv7h=('27109b97ce2e8db2e1e5df19180993f42461ebf5e772a236319750253ac0563b')
sha256sums_aarch64=('76428750d84fde57e2de424c412bfec210d883b3ce5fd469682d0a026e5bf4c3')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
