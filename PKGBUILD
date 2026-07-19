# Maintainer: Frank Boerman <frank@amunanalytics.eu>
pkgname=fbstatus-cli
pkgver=1.3
pkgrel=1
pkgdesc="This is a terminal tool to interact and display the Core Flowbased status page at https://status.coreflowbased.eu/"
arch=('x86_64')
url="https://github.com/AmunAnalytics/flowbased-status-cli"
license=('GPLv3.0')
depends=()
optdepends=()
makedepends=()
source=("$pkgname-$pkgver.zip::https://github.com/AmunAnalytics/flowbased-status-cli/releases/download/V$pkgver/fbstatus-V$pkgver-linux.zip")
sha256sums=("bc95c798a3105b408419ff4f55c9691fe24c15a5920323e7f7784d3adec300fc")
options=('!strip' '!debug')

package() {
	install -Dm755 "$srcdir/fbstatus" "$pkgdir/usr/bin/fbstatus"
}
