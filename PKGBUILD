# Contributor: Excitable Snowball <excitablesnowball@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=doi2bib
pkgver=0.4.0
pkgrel=1
pkgdesc="Generate a bibtex given a doi"
url="https://github.com/bibcure/doi2bib"
arch=('any')
license=('AGPL3')
depends=('python-requests' 'python-bibtexparser' 'python-future')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibcure/doi2bib/archive/$pkgver.tar.gz")
sha256sums=('272458eb88a34ab0fd4c69c6a4f2698496ccd9791d827f52b6c2b3ae6a3a221c')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
