# Maintainer: Lars HagstrÃ¶m <lars@foldspace.nu>
pkgname=s-tui
pkgver=0.6.7
pkgrel=2
pkgdesc="Terminal UI stress test and monitoring tool "
arch=('any')
url="https://github.com/amanusk/s-tui"
license=('GPL2')
groups=()
depends=('stress' 'python' 'python-urwid' 'python-psutil' 'python-setuptools')
options=(!emptydirs)
install=
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('d5666e9e6c0b25955bf20a43e86c4ed5da3365a0')
conflicts=("s-tui-git")


package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

