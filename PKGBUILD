#Maintainer: RSKYS <pouria dot rz at outlook dot com>

pkgname=thefuck-git
pkgver=3.31
pkgrel=1
pkgdesc='Magnificent app which corrects your previous console command'
arch=(any)
license=(MIT)
url="https://github.com/nvbn/thefuck"
depends=(python-mock python-pypandoc python-pyte python-pytest python-colorama python-psutil)
source=(
  https://github.com/nvbn/thefuck/archive/refs/tags/3.31.tar.gz
)

md5sums=(
  2a2b933426871da927fcf7857188344e
)

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
