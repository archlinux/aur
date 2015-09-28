pkgname=archvyrt
pkgver=0.1.1
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python3')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/a/archvyrt/archvyrt-0.1.1.tar.gz')
md5sums=('20ceeef7e8278222f2ea3be72925c2aa')

build() {
    cd $srcdir/archvyrt-0.1.1
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-0.1.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
