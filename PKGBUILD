# Maintainer: tocic <tocic at protonmail dot ch>
# Contributor: Philipp Schmitt <philipp@schmitt.co> (GitHub: https://github.com/pschmitt/aur-python2-flask-cors)

pkgbase='python2-flask-cors'
pkgname=('python2-flask-cors')
_name=Flask-Cors
pkgver=3.0.7
pkgrel=1
pkgdesc="A Flask extension for handling Cross Origin Resource Sharing (CORS), making cross-origin AJAX possible"
arch=('any')
url='https://pypi.org/project/Flask-Cors'
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2' 'python2-flask>=0.9' 'python2-six')
source=("$pkgbase-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('4448765829502d74745a976aa0620c1a')
sha256sums=('7e90bf225fdf163d11b84b59fb17594d0580a16b97ab4e1146b1fb2737c1cfec')

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --prefix=/usr --optimize=1
  install -Dm644 ./LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
