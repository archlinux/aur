# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.3.10
pkgrel=1
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/pynput/archive/v${pkgver}.tar.gz")
sha512sums=('5f5050013db5a8bf728748c09c43acd6fdf792ba48d9bacb8fa0198712289085213d1c930637e773f7ed25974a5ad8995e7e26e3638a4eda380e554f3922282f')

package_python-pynput() {
    makedepends=('python-setuptools' 'python-sphinx')
    depends=('python-xlib' 'python-six')
    cd "$srcdir/pynput-${pkgver}"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}

package_python2-pynput() {
    makedepends=('python2-setuptools' 'python2-sphinx')
    depends=('python2-xlib' 'python2-six' 'python2-enum34')
    cd "$srcdir/pynput-${pkgver}"
    python2 setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1;
}
