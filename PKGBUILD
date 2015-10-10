pkgname=archvyrt
pkgver=0.3.3
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python3' 'gptfdisk' 'arch-install-scripts' 'debootstrap')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/a/archvyrt/archvyrt-0.3.3.tar.gz')
md5sums=('af90462eeb5772ea70e625b40582b9d0')

build() {
    cd $srcdir/archvyrt-0.3.3
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-0.3.3
    python setup.py install --root="$pkgdir" --optimize=1 
}
