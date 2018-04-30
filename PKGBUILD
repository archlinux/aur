# Maintainer:   Maximilian Weiss         <$(echo "bWF4QG1heHdlaXNzLmlv" | base64 -d)>
# Contributor:  The Vertcoin Developers  <$(echo "Y29udGFjdEB2ZXJ0Y29pbi5vcmcK" | base64 -d)>

pkgname=python-vtc_scrypt
pkgver=1.1.5
pkgrel=1
pkgdesc='Bindings for scrypt-n proof of work used by Vertcoin'

arch=('any')
url='https://pypi.python.org/pypi/vtc_scrypt'
license=('MIT')

depends=('python-setuptools' 'scrypt')

provides=('python-vtc_scrypt')
conflicts=('python-vtc_scrypt')

source=('https://files.pythonhosted.org/packages/44/52/fa0eac61c6817adb00bd8f05e2b2130d91f35350ea49e170d890ed27d549/vtc_scrypt_new-1.1.5.tar.gz')

md5sums=('7e0810d0c17331dae5073e69d647f19e')

package() {
    cd "$srcdir/vtc_scrypt_new-1.1.5/"
    python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
