# Maintainer: Shibam Roy <royshibam9826@gmail.com>
pkgname=easyfeh
pkgver=0.1.0
pkgrel=1
pkgdesc="An easy, and user-friendly feh wrapper"
arch=('any')               
url="https://github.com/ShibamRoy9826/easyfeh"
license=('MIT')           
depends=('python' 'python-toml' 'python-requests' 'python-beautifulsoup4')       
makedepends=('python-setuptools') 
source=("https://github.com/ShibamRoy9826/easyfeh/releases/download/alpha/easyfeh-v0.1.0.tar.gz")
sha256sums=('17d766944f5175f4632808434865cac88dcecd68a94699d49c660dff311bfe97')

package() {
    cd "$srcdir/easyfeh-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
