# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=netbird-ui-bin
pkgver=0.49.0 # datasource=github-releases depName=netbirdio/netbird
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
sha256sums=('f6dc978937db333a37180b0a9a62f2e5a45ea790cf851acd70d4e5cacaca1e63')

package() {
	install -Dm755 "netbird-ui" "$pkgdir/usr/bin/netbird-ui"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
