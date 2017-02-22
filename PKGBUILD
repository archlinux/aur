# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# vim: set ts=2 sw=2 et:

pkgname=journalwatch
pkgver=1.0.1
pkgrel=1
pkgdesc="Filter error messages from systemd journal, similar to logcheck/logwatch."
arch=(any)
url="https://pypi.python.org/pypi/journalwatch/"
license=('GPL')
depends=('python' 'python-systemd')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('5355ac40b45ab223ec79b28ad1cbb6a1')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
