# Maintainer: Patrice Peterson <runiq at archlinux dot us>

pkgname=jrnl
pkgver=2.4.2
pkgrel=1
pkgdesc="A simple command line journal application that stores your journal in a plain text file"
arch=('any')
url="https://jrnl.sh"
license=('MIT')
depends=('python-pyxdg>=0.26'
         'python-pyxdg<1.0'
         'python-parsedatetime>=2.4' 
         'python-parsedatetime<3.0'
         'python-cryptography>=2.7'
         'python-cryptography<3.0'
         'python-passlib>=1.7'
         'python-passlib<2.0'
         'python-parsedatetime>=2.4'
         'python-parsedatetime<3.0'
         'python-keyring>=19.0'
         'python-keyring<22.0'
         'python-pytz>=2019.1'
         'python-pytz<2021.0'
         'python-tzlocal>1.5' 
         'python-tzlocal<3.0'
         'python-asteval>=0.9.14'
         'python-asteval<1.0'
         'python-colorama>=0.4.1'
         'python-colorama<1.0'
         'python-dateutil>=2.8'
         'python-dateutil<3.0'
         'python-yaml>=5.1'
         'python-yaml<6.0'
         'python-ansiwrap>=0.8.4'
         'python-ansiwrap<1.0')
source=("https://pypi.python.org/packages/source/j/$pkgname/$pkgname-${pkgver}.tar.gz")
sha256sums=('1d13a635c7bff42a9b833a56f47ac5086eb4ed8d3d91e5a7b96ef05f4d82a616')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
