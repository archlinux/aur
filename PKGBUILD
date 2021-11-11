# Maintainer: M Nabil Adani <nblid48[at]gmail[dot]com>

pkgname=python-pyrof-git
pkgver=0.1.0
pkgrel=1
pkgdesc='Python wrappers for dynamic menus (rofi, fzf)'

arch=('any')
url='https://github.com/nesstero/pyrof'
license=('MIT')

makedepends=('python-setuptools')
depends=('python-traitlets' 'rofi' 'fzf')

source=("${pkgname}::git+https://github.com/nesstero/pyrof.git")
sha256sums=('SKIP')

# pkgver(){
#     cd "${pkgname}"
#     git describe --long | cut -d "-" -f 1
# }

package() {
   cd "$srcdir/$pkgname"
   python setup.py install --root="$pkgdir/" --optimize=1 
}


