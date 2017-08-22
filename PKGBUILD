# Maintainer: Lars HagstrÃ¶m <lars@foldspace.nu>
pkgname=s-tui
pkgver=0.4.3
pkgrel=1
pkgdesc="Terminal UI stress test and monitoring tool "
arch=('any')
url="https://github.com/amanusk/s-tui"
license=('GPLv2')
groups=()
depends=('stress' 'python2' 'python2-urwid')
#makedepends=('git' 'python-setuptools')
options=(!emptydirs)
install=
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('dc7f96e1cf6731a04258d993e0e52ca73b2d5a9d')
conflicts=("s-tui-git")


package() {
  cd "$srcdir/$pkgname-$pkgver"
  pwd
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

