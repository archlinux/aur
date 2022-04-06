# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=pomerium-cli-bin
pkgver=0.17.1
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
sha256sums_x86_64=('4e4620952787620f8dabc0d24841213ef6a49e5af3a10f823f879ba5cf371584')
sha256sums_armv6h=('8afc3ab57540eaf4098994a56de3a6a13003f9a064db482e4144996496b29ff2')
sha256sums_armv7h=('7fb8f21536c590da5c2ac31aab828eabfa52b48dbbf977622863b9f831d57710')
sha256sums_aarch64=('bbc9eab003212ebbff4d608c5c722130d3287365feb0d8a5225595f82dd76206')

package() {
	install -D pomerium-cli -t "${pkgdir}/usr/bin"
}
