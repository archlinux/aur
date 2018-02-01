# Maintainer: Oguz Kurt <kurt.oguz@outlook.com>
pkgname=stock-shares
pkgver=1
pkgrel=1
pkgdesc="A cli utility that gets stock information from bloomberg."
arch=('any')
url="https://github.com/oguzkurt182/stock-shares"
license=('GPL')
depends=('sh')
depends=('python-beautifulsoup4')
depends=('python')
makedepends=('make')
source=("https://github.com/oguzkurt182/stock-shares/archive/master.zip")

package() {
	cd "$pkgname-master"
	make DESTDIR="$pkgdir/" install	
}
