# Maintainer: robertfoster

pkgname=python-rlp
pkgver=3.0.0
pkgrel=1
pkgdesc="A package for encoding and decoding data in and from Recursive Length Prefix notation"
url='https://pypi.org/project/rlp/'
license=('MIT')
arch=('any')
depends=('python' 'python-eth-utils')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/r/rlp/rlp-$pkgver.tar.gz")

package() {
  cd "${srcdir}/${pkgname##python-}-${pkgver}"
  python setup.py install \
    --prefix=/usr \
    --root="$pkgdir" \
    --optimize=1
}

sha256sums=('63b0465d2948cd9f01de449d7adfb92d207c1aef3982f20310f8009be4a507e8')
