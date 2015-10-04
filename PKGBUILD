pkgname=archvyrt
pkgver=0.3.0
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python3' 'gptfdisk' 'arch-install-scripts' 'debootstrap')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/a/archvyrt/archvyrt-0.3.0.tar.gz')
md5sums=('4a5ae1fb752f62571f14c75a98a13b09')

build() {
    cd $srcdir/archvyrt-0.3.0
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-0.3.0
    python setup.py install --root="$pkgdir" --optimize=1 
}
