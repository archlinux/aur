# Contributor: Cyberpunk <aur_linuxero@outlook.com>
# Maintainer: Cyberpunk <aur_linuxero@outlook.com>

pkgname=argcomplete
pkgver=0.9.0
pkgrel=1
pkgdesc="Argcomplete provides easy, extensible command line tab completion of arguments for your Python script."
arch=('any')
url="https://pypi.python.org"
license=('Apache')
depends=('python2' 'python')
source=("https://pypi.python.org/packages/source/a/argcomplete/argcomplete-$pkgver.tar.gz")

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
sha256sums=('f97577332d19aea09583ecb426a49e85dc7bbc9822ab345b9c790d923413af0e')
