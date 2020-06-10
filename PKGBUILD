# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=git-revise
pkgdesc="A git subcommand to efficiently update, split, and rearrange commits"
pkgver=0.6.0
pkgrel=2
arch=('any')
url="https://mystor.github.io/git-revise.html"
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/g/git-revise/git-revise-$pkgver.tar.gz")
depends=('git' 'python')
makedepends=('python-setuptools')

package() {
  cd $srcdir/$pkgname-$pkgver
  python3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

sha256sums=('21e89eba6602e8bea38b34ac6ec747acba2aee876f2e73ca0472476109e82bf4')
