# Maintainer: Fahad Hossain <8bit.demoncoder AT gmail.com>
pkgname='xopen-file'
pkgver='1.0.0'
pkgrel=1
pkgdesc="Open files using xdg-open"
arch=('any')
url="https://github.com/fa7ad/xopen-file"
license=('MIT')
depends=('python>=3.5', 'xdg-utils')
makedepends=('git')
options=(!emptydirs)
source=("$pkgname"::"git://github.com/fa7ad/xopen-file.git")
md5sums=("SKIP")

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --prefix="/usr" --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 ft=sh et:
