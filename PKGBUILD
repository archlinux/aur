# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et:

pkgname=journalwatch
pkgver=0.1.1
pkgrel=1
pkgdesc="Filter error messages from systemd journal, similar to logcheck/logwatch."
arch=(any)
url="https://pypi.python.org/pypi/journalwatch/"
license=('GPL')
depends=('python')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/j/journalwatch/journalwatch-${pkgver}.tar.gz"
        "https://pypi.python.org/packages/source/j/journalwatch/journalwatch-${pkgver}.tar.gz.asc")
md5sums=('SKIP' 'SKIP')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
