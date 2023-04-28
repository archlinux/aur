# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-cryptography-vectors
# Do NOT update. 3.4 dropped support for Python2
pkgver=3.3.2
pkgrel=1
pkgdesc="Test vectors for the cryptography package (Legacy Python 2 version)"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/cryptography-vectors"
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.io/packages/source/c/cryptography-vectors/cryptography_vectors-$pkgver.tar.gz")
sha512sums=('18590adb96a6f04b8a41d4346b126b8adfc854cbcec85f8c1c0a23b1b363f215b37da60ea94a481b8fd7752f07fba515b08fc18faf2e29fb858e133129971f7c')

package() {
   cd cryptography_vectors-$pkgver
   python2 setup.py install --root="$pkgdir" --optimize=1
}
