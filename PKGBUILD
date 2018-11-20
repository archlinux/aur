# Maintainer: Hexchain Tong <i at hexchain dot org>
pkgname=neovim-remote
pkgver=2.1.1
pkgrel=1
pkgdesc="Support --remote and friends for Neovim"
arch=(any)
url="https://github.com/mhinz/neovim-remote"
license=('MIT')
depends=('python-neovim' 'python-psutil')
makedepends=('git' 'python-setuptools')
source=("https://github.com/mhinz/neovim-remote/archive/v$pkgver.tar.gz")
sha256sums=('fb7a6791d71e451b6b5bcacecd984f890e11cecbd890f40d03934e35a1f4d492')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install -O1 --root="$pkgdir/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
