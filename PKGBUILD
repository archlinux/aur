# Maintainer: Manuel Domínguez López <mdomlopatgmaildotcom>
_pkgver_year=2023
_pkgver_month=02
_pkgver_day=27
pkgname=sskit-systemd
_pkgname=sskit
pkgver=0.8.1b
pkgrel=1
pkgdesc="SSKit Systemd service for making snapshots."
license=("GPLv3+")
url="https://github.com/mdomlop/sskit"
arch=('any')
source=("https://github.com/mdomlop/$_pkgname/archive/refs/tags/$pkgver.tar.gz")
depends=("sskit")
groups=("systemd-world")

package() {
	cd $_pkgname-$pkgver/dist/systemd
	make install DESTDIR=$pkgdir
}
md5sums=('752901711811f0711582ab3ddddc7a07')
