# Maintainer: groestlcoin <groestlcoin@gmail.com>

pkgname=python-groestlcoin_hash
pkgver=1.0.3
pkgrel=1
pkgdesc='Python bindings for groestl proof of work used by Groestlcoin'
arch=('any')
url='https://github.com/Groestlcoin/groestlcoin-hash-python'
makedepends=('python-setuptools')
license=('MIT')
source=("groestlcoin-hash-python-$pkgver.tar.gz::https://github.com/Groestlcoin/groestlcoin-hash-python/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c9586ec1502f6ee2c7cb9a95d99aeb45305a85e8566e677ad21388806a65ee14')
validpgpkeys=(287AE4CA1187C68C08B49CB2D11BD4F33F1DB499)

package() {
    cd "$srcdir/groestlcoin-hash-python-$pkgver/"
    python setup.py install --root="$pkgdir/"
}
