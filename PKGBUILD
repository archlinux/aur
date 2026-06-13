# Maintainer: Frank Boerman <frank@amunanalytics.eu>
pkgname=fbstatus-cli
pkgver=1.1
pkgrel=1
pkgdesc="This is a terminal tool to interact and display the Core Flowbased status page at https://status.coreflowbased.eu/"
arch=('x86_64')
url="https://github.com/AmunAnalytics/flowbased-status-cli"
license=('GPLv3.0')
depends=()
optdepends=()
makedepends=()
source=("$pkgname-$pkgver.zip::https://github.com/AmunAnalytics/flowbased-status-cli/releases/download/V$pkgver/fbstatus-V$pkgver-linux.zip")
sha256sums=("d32060a2c99eacd6ac6800a0150004f755934f13c02ca0b0aa1218d5e91f4bc0")
options=('!strip' '!debug')

package() {
	install -Dm755 "$srcdir/fbstatus" "$pkgdir/usr/bin/fbstatus"
}
