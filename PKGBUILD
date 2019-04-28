# Maintainer: robertfoster

_pkgname=indy_crypto
pkgname=python-${_pkgname}
pkgver=0.5.1
pkgrel=1
pkgdesc="Official wrapper for Hyperledger Indy Crypto library"
arch=(i686 x86_64)
url="https://github.com/hyperledger/indy-crypto"
license=('APACHE')
depends=('libindy-crypto')
makedepends=('python')
source=("https://files.pythonhosted.org/packages/21/a5/4f316cf4161e222ca81c9ed01b3fa7c4dd71499bc73c4112ab30d7bba76d/${_pkgname}-$pkgver.tar.gz")

package() {
	cd $srcdir/${_pkgname}-$pkgver
	python setup.py install -O1 --root="$pkgdir"
}

md5sums=('708110787cefae0543205cdbbb637552')
