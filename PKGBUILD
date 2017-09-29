# Maintainer: Lars HagstrÃ¶m <lars@foldspace.nu>
pkgname=s-tui
pkgver=0.6.4
pkgrel=2
pkgdesc="Terminal UI stress test and monitoring tool "
arch=('any')
url="https://github.com/amanusk/s-tui"
license=('GPLv2')
groups=()
depends=('stress' 'python2' 'python2-urwid' 'python2-psutil' 'python2-setuptools')
options=(!emptydirs)
install=
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('6897b98e572026a209ed162d87a96e999a77254a')
conflicts=("s-tui-git")


package() {
  cd "$srcdir/$pkgname-$pkgver"
  pwd
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

