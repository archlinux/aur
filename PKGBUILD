# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.22.0
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
sha256sums_x86_64=('d888953d8aee7e417f1cca1f22b7712adf885a4015e4c19ea1807ac22d2b881f')
sha256sums_armv6h=('a7a51aecf969cb86159f12a68f31dd7518047b6dd3b3acd98f900435d1b8a597')
sha256sums_armv7h=('ccc23f72753846d010cf65bbe967762e6c5cfe777276fa3f4899c3a4f5dfb234')
sha256sums_aarch64=('7c394748a938da25d7a20acb53e7c5fe295b0d1b7f7d910c85a1585577aae808')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
