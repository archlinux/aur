# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-pynput' 'python2-pynput')
pkgver=1.3.9
pkgrel=1
pkgdesc="Python library to monitor and control user input devices"
arch=('any')
url="https://github.com/moses-palmer/pynput"
license=('LGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/moses-palmer/pynput/archive/v${pkgver}.tar.gz")
sha512sums=('73433ce4ffe2410cfcca5eedf8b46ec12795403d70e6702abddcf8cc6b9a230db55c58c5cb0dbd04705314bf319b352a58ead14116a518a8eda775a90787f947')

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
