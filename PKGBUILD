# Maintainer: Shibam Roy <royshibam9826@gmail.com>
pkgname=easyfeh
pkgver=0.1.3
pkgrel=1
pkgdesc="An easy, and user-friendly wrapper originally meant for feh, but works with anything!"
arch=('any')               
conflicts=('easyfeh-git')
url="https://github.com/ShibamRoy9826/easyfeh"
license=('MIT')           
depends=('feh' 'python' 'python-toml' 'python-requests' 'python-beautifulsoup4' 'python-rich')       
optdepends=(
  'swww: Enables wayland support'
  )
makedepends=('python-setuptools') 
source=("https://github.com/ShibamRoy9826/easyfeh/releases/download/beta3/easyfeh-v${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/easyfeh-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
