# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.17.4
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
sha256sums_x86_64=('855db63acb02005c213b829202562406a0865e1ff9a99fc441455487bfc82f03')
sha256sums_armv6h=('bdaaf66893432072bebf682d0b212236aea24ce95eb47c22ac611e01ae71a25a')
sha256sums_armv7h=('e95d97bd1c6bd7795a877ed6d5ff5ac6f9a5c74f4cfdb0fca14287e0de981482')
sha256sums_aarch64=('ad491abe50106945f49b2357ea6ad497187963c6bfe724f1dfa27a0bfa5ca81f')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
