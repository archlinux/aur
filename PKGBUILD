# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  The Vertcoin Developers  <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>

pkgname=python2-vtc_scrypt
pkgver=1.0
pkgrel=1
pkgdesc='Bindings for scrypt-n proof of work used by Vertcoin'

arch=('any')
url='https://pypi.python.org/pypi/vtc_scrypt'
license=('MIT')

depends=('python2-setuptools' 'scrypt')

provides=('python2-vtc_scrypt')
conflicts=('python2-vtc_scrypt')

source=('vtc_scrypt-1.0.tar.gz::https://pypi.python.org/packages/66/23/f42fd76deb380d24d6dde744b3e3cdd9ebe8378874e05c37aeea9d7fa739/vtc_scrypt-1.0.tar.gz#md5=ac51fb951f75b97d6f6963859f933035')

md5sums=('ac51fb951f75b97d6f6963859f933035')

package() {
    cd "$srcdir/vtc_scrypt-1.0/"
    python2 setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
