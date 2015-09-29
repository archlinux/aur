pkgname=archvyrt
pkgver=0.2.0
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python3')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/a/archvyrt/archvyrt-0.2.0.tar.gz')
md5sums=('c61be7b1aecad6952cc92fb32ce50743')

build() {
    cd $srcdir/archvyrt-0.2.0
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-0.2.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
