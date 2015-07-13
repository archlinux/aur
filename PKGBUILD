# Maintainer: Kevin Slagle <kjslag at gmail dot com>
pkgname=python-snakeviz
_pythonname=snakeviz
pkgver=0.4.0
pkgrel=1
pkgdesc='A viewer for Python profiling data that runs as a web application in your browser. It is inspired by the wxPython profile viewer RunSnakeRun.'
arch=('any')
url="http://jiffyclub.github.io/snakeviz"
license=('CUSTOM')
depends=('python' 'python-tornado' 'python-jinja')
source=("https://pypi.python.org/packages/source/s/$_pythonname/$_pythonname-0.4.0.tar.gz")
md5sums=('a7f59cded288ac7dab683f718dd34727')
options=(!emptydirs)

package() {
  cd "$srcdir/$_pythonname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
