# Maintainer: picokan <todaysoracvle@protonmail.com>

pkgname=bazarr-runit
pkgver=20241225
pkgrel=1
pkgdesc="Runit service script for bazarr."
arch=("any")
url="https://bazarr.media"
license=("GPL-3.0-or-later")
depends=("bazarr" "runit")
install=bazarr.install
source=("bazarr.run")
sha256sums=('25e8b8f20d46e7d534a88f7d0aaf0c7da852bda9f4be7b7ec2d8a24016b1afcc')

package() {
	cd "$srcdir"
	install -Dm755 bazarr.run "$pkgdir/etc/runit/sv/bazarr/run"
}
