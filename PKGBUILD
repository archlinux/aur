# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et:

pkgname=journalwatch
pkgver=0.2.2
pkgrel=1
pkgdesc="Filter error messages from systemd journal, similar to logcheck/logwatch."
arch=(any)
url="https://pypi.python.org/pypi/journalwatch/"
license=('GPL')
depends=('python' 'python-systemd')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/j/journalwatch/journalwatch-${pkgver}.tar.gz")
md5sums=('5c3a03b5e9b97027b0ead49bfc6c27e3')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
