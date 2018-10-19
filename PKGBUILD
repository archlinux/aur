# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-block_tracing
_pkgname=block_tracing
pkgver=1.0.1
pkgrel=1
pkgdesc="Protect process memory"
arch=('i686' 'x86_64')
url="https://github.com/rianhunter/block_tracing"
license=('GPL3')
depends=('python')
makedepends=('python-setuptools')
#source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/a2/30/6d445d512bf017620508752663dd1925f398f249ea01b5648fc5dca720bb/$_pkgname-$pkgver.tar.gz")
md5sums=('25096864c88525a1897b256d27975c41')

package() {
	cd "$_pkgname-$pkgver"
	python setup.py install --root="$pkgdir/"
}
