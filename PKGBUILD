# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=rfm-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="Command-line interface to perform file management on RepRapFirmware based devices."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/wilriker/rfm"
provides=('rfm')
conflicts=('rfm')
license=('MIT')
source_x86_64=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_amd64.tgz")
source_arm=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm.tgz")
source_armv6h=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm.tgz")
source_armv7h=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm.tgz")
source_aarch64=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm64.tgz")
sha256sums_x86_64=('d9d63aa09529745a883f4cce521f44c5e6ed4e906a2d918d71e7a489828c8a01')
sha256sums_arm=('e64410b3a812b65acea0612f88ae1a1265a67cc42c6ed816ddd5643f1763db52')
sha256sums_armv6h=('e64410b3a812b65acea0612f88ae1a1265a67cc42c6ed816ddd5643f1763db52')
sha256sums_armv7h=('e64410b3a812b65acea0612f88ae1a1265a67cc42c6ed816ddd5643f1763db52')
sha256sums_aarch64=('34fead1227993f18a80452903008ad65b732e436262601cc23f2ea6cb9c46601')

package() {
	install -Dm 755 rfm "${pkgdir}/usr/bin/rfm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
