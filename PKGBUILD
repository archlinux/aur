# Maintainer: Elias Werberich <elias@werberich.de>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org> (from python-pyro)
# Contributor: Angel Velasquez <angvp@archlinux.org> (from python-pyro)
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.br> (from python-pyro)

pkgname=python-pyro5
pkgver=5.13.1
pkgrel=1
epoch=0
pkgdesc='Distributed object middleware for Python (RPC), Version 5'
url='https://github.com/irmen/Pyro5'
arch=(any)
license=(MIT)
makedepends=('git' 'python-setuptools')
optdepends=('python-msgpack>=0.5.2')
depends=('python>=3.7' 'python-serpent>=1.40')
conflicts=('python-pyro5-git')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

package() {
  cd Pyro5
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# getver: github.com/irmen/Pyro5/tags
# vim: ts=2 sw=2 et:
