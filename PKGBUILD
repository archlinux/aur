# Maintainer: Joaquim Monteiro <joaquim.monteiro@protonmail.com>

_name=iOSbackup
pkgname=python-iosbackup
pkgver=0.9.912
pkgrel=1
pkgdesc='Library for reading and extracting files from password-encrypted iOS backups'
arch=(any)
url='https://github.com/avibrazil/iOSbackup'
license=('LGPL')
depends=('python' 'python-biplist' 'python-pycryptodome')
makedepends=('python-pip' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('00793b3439d18466e6f8538b33a8660f11d99c2237a8d3879e10d7bb896bb230efb4c43076ae6e272b5cea4d970d69d2b088f3ce9d3cbe2a373f3cd7d22433c7')

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
