pkgname=archvyrt
pkgver=0.2.2
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python3' 'gptfdisk' 'arch-install-scripts')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=('https://pypi.python.org/packages/source/a/archvyrt/archvyrt-0.2.2.tar.gz')
md5sums=('83012c48832319aab4d81ee715eacb34')

build() {
    cd $srcdir/archvyrt-0.2.2
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-0.2.2
    python setup.py install --root="$pkgdir" --optimize=1 
}
