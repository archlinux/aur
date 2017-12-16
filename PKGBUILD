# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=zzzpython-keepkey
pkgver=4.0.2
pkgrel=1
pkgdesc="Python library for communicating with KeepKey Hardware Wallet"
arch=('any')
depends=('python'
         'python-ecdsa'
         'python-hidapi'
         'python-mnemonic'
         'python-protobuf')
makedepends=('python-setuptools')
url="https://github.com/keepkey/python-keepkey"
license=('LGPL3')
source=("https://pypi.python.org/packages/bd/7c/8edc3d017b4b02f11533083d9987d11707fcf82ab6606c9b9aedd2e95b4c/keepkey-4.0.2.tar.gz")
md5sums=('d872868e3c90ff33f969b1cb140e76ab')
provides=('keepkeyctl' 'python-keepkey')
conflicts=('keepkeyctl')

package() {
    ls
  cd "$srcdir/keepkey-$pkgver"

  msg2 'Installing...'
  python setup.py install --root="$pkgdir" --optimize=1
}
