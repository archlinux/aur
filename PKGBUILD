# Maintainer: robertfoster

_pkgname=indy-plenum
pkgname=hyperledger-${_pkgname}
pkgver=1.6.658
pkgrel=1
pkgdesc="The heart of the distributed ledger technology inside Hyperledger Indy"
arch=(i686 x86_64)
url="https://github.com/hyperledger/${_pkgname}"
license=('APACHE')
groups=('hyperledger')
depends=('python-base58' 'python-indy_crypto' 'python-ioflo' 'python-intervaltree' 'python-jsonpickle' 'python-leveldb' 'python-libnacl' 'python-msgpack' 'python-orderedset'
	'python-portalocker' 'python-prompt_toolkit' 'python-psutil' 'python-pygments' 'python-pysha3' 'python-pyzmq' 'python-raet' 'python-rlp' 'python-semantic-version'
'python-sortedcontainers' 'python-ujson')
makedepends=('python')
source=("https://github.com/hyperledger/${_pkgname}/archive/$pkgver-master.tar.gz")

package() {
	cd $srcdir/${_pkgname}-$pkgver-master
	python setup.py install -O1 --root="$pkgdir"
}

md5sums=('ad483f34014d12751a03c59828d44203')
