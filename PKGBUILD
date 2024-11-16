# Maintainer: Shibam Roy <royshibam9826@gmail.com>
pkgname=easyfeh
pkgver=0.1.0
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
source=("https://github.com/ShibamRoy9826/easyfeh/releases/download/alpha/easyfeh-v0.1.0.tar.gz")
sha256sums=('6fa366e2444e5125de179b35370f6a9259ae7fed4006c900f33fbcfd69f2deb1')

package() {
    cd "$srcdir/easyfeh-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
