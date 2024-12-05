# Maintainer: Shibam Roy <royshibam9826@gmail.com>
pkgname=easyfeh
pkgver=0.1.4
pkgrel=1
pkgdesc="An easy, and user-friendly wrapper originally meant for feh, but works with anything!"
arch=('any')               
conflicts=('easyfeh-git')
url="https://github.com/ShibamRoy9826/easyfeh"
license=('MIT')           
depends=('feh' 'python' 'python-toml' 'python-requests' 'python-beautifulsoup4' 'python-rich')       
optdepends=(
  'swww: Enables wayland support'
  'python-colorthief: Enables the feature to extract colors from current wallpaper'
  'python-pillow: Enables wallpaper effects feature'
  )
makedepends=('python-setuptools') 
source=("https://github.com/ShibamRoy9826/easyfeh/releases/download/stable/easyfeh-${pkgver}.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/easyfeh-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
