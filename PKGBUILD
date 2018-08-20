# Maintainer: Kamil Cukrowski <kotekkc@gmail.com>

pkgname=chart
pkgver=0.0.3
pkgrel=1
pkgdesc="Quick & smart charting for STDIN"
arch=(x86_64)
url="https://marianogappa.github.io/chart/"
license=('MIT')
source=("https://github.com/marianogappa/chart/releases/download/v3.0.0/chart_3.0.0_linux_amd64.tar.gz")
md5sums=("9c3075042e71225c768f46532e1012ab")

package() {
	install -o root -g root -d             $pkgdir/usr/bin
	install -o root -g root -m 755 ./chart $pkgdir/usr/bin/chart
}

