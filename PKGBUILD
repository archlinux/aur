# Maintainer: Doug Patti <douglas.patti@gmail.com>

pkgname=pellets
pkgver=1.0.1
pkgrel=1
pkgdesc="manage installed Arch packages with a configuration file"
arch=('any')
url="https://github.com/dpatti/pellets"
license=('Unlicense')
depends=('bash')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
md5sums=('268bdaaef8a1be7521ed5acd96025393')

package() {
	install -Dm775 "$srcdir/$pkgname-$pkgver/pellets" "$pkgdir/usr/bin/pellets"
}
