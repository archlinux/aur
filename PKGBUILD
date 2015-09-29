pkgname=archvyrt
pkgver=0.2.1
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python3')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/a/archvyrt/archvyrt-0.2.1.tar.gz')
md5sums=('fe18aa29cf1efca1fc55bd608bab9a6d')

build() {
    cd $srcdir/archvyrt-0.2.1
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-0.2.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
