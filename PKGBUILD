# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Aaron Schaefer <aaron@elasticdog.com>

pkgname=python38-pexpect
pkgver=4.8.0
pkgrel=6
pkgdesc='For controlling and automating applications'
arch=(any)
url='https://pexpect.readthedocs.org/en/stable/'
license=(MIT)
depends=(python38 python38-ptyprocess)
makedepends=(git python38)
source=("git+https://github.com/pexpect/pexpect#commit=5eed1a31a2853a09b7367c59fbd1a4a0b53341df") # 4.8.0
sha512sums=('SKIP')

package() {
  cd pexpect
  python3.8 setup.py install --root="$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: pypi.python.org/pypi/pexpect
# vim: ts=2 sw=2 et:
