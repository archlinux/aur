# Maintainer: Lars HagstrÃ¶m <lars@foldspace.nu>
pkgname=s-tui
pkgver=0.5.0
pkgrel=1
pkgdesc="Terminal UI stress test and monitoring tool "
arch=('any')
url="https://github.com/amanusk/s-tui"
license=('GPLv2')
groups=()
depends=('stress' 'python2' 'python2-urwid' 'python2-psutil')
makedepends=('python2-setuptools')
options=(!emptydirs)
install=
source=("$url/archive/v$pkgver.tar.gz")
sha1sums=('94e52ae9d6e91ebdd47818e17bad958acc8d5d04')
conflicts=("s-tui-git")


package() {
  cd "$srcdir/$pkgname-$pkgver"
  pwd
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

