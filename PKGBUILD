# Maintainer: Florian B.

pkgname=powerline-shell
pkgver=0.5.4
pkgrel=1
pkgdesc="A pretty prompt for your shell"
arch=('any')
url="https://github.com/b-ryan/powerline-shell"
license=('MIT')
depends=('python' 'python-argparse')
makedepends=('python-setuptools')
source=("https://github.com/b-ryan/powerline-shell/archive/v$pkgver.tar.gz")
sha256sums=('6bfd04113d8470132e447f4cc6b5f2c4522b0aaf374652e9b9bd2a3bb4eac329')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
}
