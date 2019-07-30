# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.br>

pkgname=python2-pyro
pkgver=4.76
pkgrel=1
pkgdesc='Distributed object middleware for Python (RPC)'
url='https://github.com/irmen/Pyro4'
arch=(any)
license=(MIT)
makedepends=(git)
depends=(python2 python-serpent)
source=("git+$url#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd Pyro4
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/irmen/Pyro4/tags
# vim: ts=2 sw=2 et:
