# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Florian B.

pkgname=powerline-shell
pkgver=0.7.0
_commit=a9b8c9bb39dbfb7ec3c639e497b5a76fa6dcb8cc
pkgrel=1
pkgdesc="A pretty prompt for your shell"
arch=('any')
url="https://github.com/b-ryan/powerline-shell"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/b-ryan/powerline-shell/archive/$_commit.zip")
sha256sums=('1f55c35ac14593446a82f6d5dedd3b89429dcfec99eb8c459a8dfb6ee78abf4d')

package() {
  cd $pkgname-$_commit
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
