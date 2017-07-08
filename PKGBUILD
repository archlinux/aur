# Maintainer: Jonas Große Sundrup/cherti <aur@letopolis.de>

pkgname=python-blockchain-parser
pkgver=0.1.4
pkgrel=1
pkgdesc="A Python 3 Bitcoin blockchain parser"
arch=('any')
url="https://github.com/alecalve/python-bitcoin-blockchain-parser"
license=('LGPL3')
depends=('python' 'python-python-bitcoinlib')
makedepends=('python-setuptools')
source=("https://github.com/alecalve/python-bitcoin-blockchain-parser/archive/0.1.4.tar.gz")
sha256sums=('dbbfa7455098cb72fbd89f44036a6af6564f274a0503c93048bb6cc432835c69')
md5sums=('0a2a82ade2228ae588c4208be810ee23')

build() {
	cd "python-bitcoin-blockchain-parser-$pkgver"
	python setup.py build
}

package() {
	cd "python-bitcoin-blockchain-parser-$pkgver"
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
