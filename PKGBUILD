# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=netbird-ui-bin
pkgver=0.58.2 # datasource=github-releases depName=netbirdio/netbird
pkgrel=1
pkgdesc='Official GUI for the Netbird client'
arch=('x86_64')
url='https://netbird.io'
license=('BSD-3-Clause')
provides=('netbird-ui')

depends=(
	'glibc'
	'libglvnd'
	'libx11'
	'netbird'
)

source=("https://github.com/netbirdio/netbird/releases/download/v${pkgver}/netbird-ui-linux_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c01da42b8940a29a0cd3c596031f9b2f3b3504e8be9a0c9ac95629820d2e8a80')

package() {
	install -Dm755 "netbird-ui" "$pkgdir/usr/bin/netbird-ui"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
