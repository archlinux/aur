# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=rfm-bin
pkgver=1.1.0
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
sha256sums_x86_64=('ea43ad5fdb38047c2f4f21e45abf97445eb46f0ca31067c9eb35bc49a5cde1a4')
sha256sums_arm=('9dfa458ddc67cd9bbad8e0e8a118b4e9c49db363021087d2e8fd69b98db2c920')
sha256sums_armv6h=('9dfa458ddc67cd9bbad8e0e8a118b4e9c49db363021087d2e8fd69b98db2c920')
sha256sums_armv7h=('9dfa458ddc67cd9bbad8e0e8a118b4e9c49db363021087d2e8fd69b98db2c920')
sha256sums_aarch64=('380986c03d6c414857ad523f40f806325f4727dc08083dcfdc0c9969b54e96b9')

package() {
	install -Dm 755 rfm "${pkgdir}/usr/bin/rfm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
