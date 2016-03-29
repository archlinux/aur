# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-mwclient
pkgdesc="A Python framework to interface with the MediaWiki API"
pkgver=0.8.1
pkgrel=1
arch=('any')
url="https://github.com/mwclient/mwclient"
license=('MIT')
depends=('python')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mwclient/mwclient/archive/v${pkgver}.tar.gz")

package() {
  cd "mwclient-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
sha1sums=('5cf98b36be4341f01817a46e8277f3fa633dfd77')
sha256sums=('4dde79a603e0fa4e1c8abd1b296dd08676d68d2ce77b5722a55b5ef83c6dd753')
