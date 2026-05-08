# Maintainer: BrLi <brli at chakralinux.org>

pkgname=ublacklist
pkgver=9.6.0
pkgrel=1
pkgdesc="uBlackList prevents the sites you specify from appearing in search engines' results."
arch=('any')
url="https://github.com/iorate/ublacklist"
license=('MIT')
source=("${url}/releases/download/v${pkgver}/ublacklist-v${pkgver}-chrome.zip")
b2sums=('4f8435d50f0c01d3e174f67f144f06f1e8c6bab35dfc4be4c5471dc59520c1d3709df03bb1361bd3efdacdc3ba5722dd1d3aa3e4359ae799291fa5c21bee0e47')

package() {
	cd "$srcdir"

	# create install dir
	install -dm755 "$pkgdir/usr/lib/${pkgname}"

	# install extension files
	cp -a icons manifest.json pages scripts third-party-notices.txt _locales "$pkgdir/usr/lib/${pkgname}"
}
