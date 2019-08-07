# Maintainer: Manuel Coenen <manuel.coenen@gmail.com>
pkgname=rfm
pkgver=1.1.0_RC3
pkgrel=1
pkgdesc="Command-line interface to perform file management on RepRapFirmware based devices."
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/wilriker/rfm"
license=('MIT')
source_x86_64=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_amd64.tgz")
source_arm=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm.tgz")
source_armv6h=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm.tgz")
source_armv7h=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm.tgz")
source_aarch64=("https://github.com/wilriker/rfm/releases/download/v${pkgver//_/-}/rfm-linux_arm64.tgz")
md5sums_x86_64=('SKIP')
md5sums_arm=('SKIP')
md5sums_armv6h=('SKIP')
md5sums_armv7h=('SKIP')
md5sums_aarch64=('SKIP')

package() {
	install -Dm 755 rfm "${pkgdir}/usr/bin/rfm"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
