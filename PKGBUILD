# Maintainer: Electrux <ElectruxRedsworth AT gmail DOT com>

pkgname=dr
pkgver=1.0
pkgrel=1
pkgdesc="An ed-like client for devRant written in python"
arch=('any')
url="https://github.com/Ewpratten/dr"
license=('MIT')

makedepends=('python-setuptools' 'python')
depends=('python-setuptools' 'python')

source=("https://github.com/ewpratten/$pkgname/archive/$pkgver-nix.tar.gz")
sha512sums=('25d80b9b0d5982725925170e194eea7a19cb2295bf5f6dca4bc9abfa3564998a02dc64044aad0e4cfe8a2469583850632b74b3c7f159cc43aba644fb26a59d9d')

build() {
	cd "$srcdir/$pkgname-$pkgver-nix"
	python3 setup.py install --root="$pkgdir" --optimize=1
}

