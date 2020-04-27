#Maintainer: jnanar <info@agayon.be>


_realname=brython
pkgname=python-brython
pkgver=3.8.8
pkgrel=1
pkgdesc="A Python 3 implementation for client-side web programming"
arch=(any)
url="https://brython.info/"
license=('BSD')
depends=('python' 'python-plumbum')
options=(!emptydirs)
provides=('python-brython')
source=('https://github.com/brython-dev/brython/archive/3.8.8.tar.gz')
sha512sums=('7b648bf5cafa668bf77091f0c3dc6caec91a17a771c1fa65febb2c31c168913009952700622c88a5eadd55b75cf2a5c73e6a964bfaf57632a2247767d7cf5f2d')


package() {
  cd "$srcdir/$_realname-$pkgver/setup"
  python setup.py install --root="$pkgdir/" --optimize=1  
}

