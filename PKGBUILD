# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=rfm-bin
pkgver=1.2.0
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
sha256sums_x86_64=('2446222e1ac414b6eee5a635be3a6d265e719de376d1102d2dc62f18f21078f1')
sha256sums_arm=('60d27877565f0ad75a6f40b9128518a5af6c602a7bc09253df2a2ea54ba6d411')
sha256sums_armv6h=('60d27877565f0ad75a6f40b9128518a5af6c602a7bc09253df2a2ea54ba6d411')
sha256sums_armv7h=('60d27877565f0ad75a6f40b9128518a5af6c602a7bc09253df2a2ea54ba6d411')
sha256sums_aarch64=('f674d28099376d6fbd3d21d882707b91b25708728fdab3796006570c68bc9eb9')

package() {
	install -Dm 755 rfm "${pkgdir}/usr/bin/rfm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
