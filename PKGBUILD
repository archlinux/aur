# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-cryptography-vectors
pkgver=38.0.3
pkgrel=1
pkgdesc="Test vectors for the cryptography package"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography-vectors"
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/c/cryptography-vectors/cryptography_vectors-$pkgver.tar.gz")
sha512sums=('3155dc396298daccdeb24e7f86131f32818eb6264110540c2639c205e57b99bc3ffd12cc9eace337e0215042734c1318e83fc8f7b1adbe20b47b8192abd618b7')

package() {
   cd cryptography_vectors-$pkgver
   python3.83 setup.py install --root="$pkgdir" --optimize=1
}
