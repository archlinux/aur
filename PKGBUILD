# Maintainer: Lars HagstrÃ¶m <lars@foldspace.nu>
pkgname=s-tui
pkgver=0.7.5
pkgrel=1
pkgdesc="Terminal UI stress test and monitoring tool "
arch=('any')
url="https://github.com/amanusk/s-tui"
license=('GPL2')
groups=()
depends=('stress' 'python' 'python-urwid' 'python-psutil' 'python-setuptools')
options=(!emptydirs)
install=
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('d4d3578a02118060f6e120518adca055e675f206')
conflicts=("s-tui-git")


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
