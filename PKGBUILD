# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=u2o
pkgver=0.7
pkgrel=3
pkgdesc='USFM to OSIS bible format converter'
arch=(any)
url=https://github.com/adyeths/u2o
license=(Unlicense)
depends=(python)
_archive="$pkgname-$pkgver"
source=("$url/archive/refs/tags/$pkgver/$_archive.tar.gz")
sha256sums=('dcda63dd61e053dcdccf948f0d88c987302e3ee2d40ae74db2c60f93b0ab0e36')

package() {
	cd "$_archive"
	install -Dm0755 u2o.py "$pkgdir/usr/bin/u2o"
	install -Dm0755 utaglist.py "$pkgdir/usr/bin/utaglist"
}
