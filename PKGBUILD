# Maintainer: Frank Boerman <frank@amunanalytics.eu>
pkgname=fbstatus-cli
pkgver=1.2
pkgrel=1
pkgdesc="This is a terminal tool to interact and display the Core Flowbased status page at https://status.coreflowbased.eu/"
arch=('x86_64')
url="https://github.com/AmunAnalytics/flowbased-status-cli"
license=('GPLv3.0')
depends=()
optdepends=()
makedepends=()
source=("$pkgname-$pkgver.zip::https://github.com/AmunAnalytics/flowbased-status-cli/releases/download/V$pkgver/fbstatus-V$pkgver-linux.zip")
sha256sums=("6802b7f187d4c112a22534c045f494510ebeb412545bfa24d3155ea6c04ba6d9")
options=('!strip' '!debug')

package() {
	install -Dm755 "$srcdir/fbstatus" "$pkgdir/usr/bin/fbstatus"
}
