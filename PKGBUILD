# Maintainer: Shibam Roy <royshibam9826@gmail.com>
pkgname=easyfeh
pkgver=0.1.1
pkgrel=2
pkgdesc="An easy, and user-friendly feh wrapper"
arch=('any')               
url="https://github.com/ShibamRoy9826/easyfeh"
license=('MIT')           
depends=('feh' 'python' 'python-toml' 'python-requests' 'python-beautifulsoup4')       
optdepends=(
  'swww: Enables wayland support'
  )
makedepends=('python-setuptools') 
source=("https://github.com/ShibamRoy9826/easyfeh/releases/download/beta/easyfeh-v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/easyfeh-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
