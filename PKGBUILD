# Maintainer: Emmanuel Gil Peyrot <emmanuel.peyrot@collabora.com>

_pyname=phabricator
pkgname="python-$_pyname"
pkgver=0.7.0
pkgrel=1
pkgdesc='Python bindings for Phabricator'
url='https://github.com/disqus/python-phabricator'
arch=('any')
license=('Apache2')
depends=('python')
source=("https://pypi.python.org/packages/94/98/f8ab84ec69776bea7e2346f86e3c033e92a40f8d565b9b16021d1737443f/$_pyname-$pkgver.tar.gz")
md5sums=('6a6882c2b5b54491966174b34d6d889e')

package() {
    cd "$_pyname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 README.rst "$pkgdir"/usr/share/doc/"$pkgname"/README.rst
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
