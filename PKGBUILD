# Maintainer: Lionel Miller <delonorm at gmail dot com>

pkgname=kontur-diag-plugin
pkgver=3.1.0.188
pkgrel=1
pkgdesc="Diag.Plugin is an extension for web browsers that allows users to install cryptographic programs for SKB Kontur services."
arch=('x86_64')
_filename="diag.plugin_amd64.000797.deb"
license=('proprietary')
depends=(
	'gtk3'
)
url="https://help.kontur.ru/"
source=("https://help.kontur.ru/files/$_filename")
sha512sums=('a9c981ede9416e605df8ff67b136ace3300c0b7bc1df01a43d319ceaea1877136cb0e8ddcaf5f9ff9df73dbec51d26bdd049f63a55a01ee2f4c8d3d703afe412')

package() {
	bsdtar -xf data.tar.xz -C "$pkgdir/"
	rm -r "$pkgdir/usr/lib64/"  # /usr/lib64 is a symlink to /usr/lib
}
