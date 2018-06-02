# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=doi2bib
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate a bibtex given a doi"
url="https://github.com/bibcure/doi2bib"
arch=('any')
license=('AGPL3')
depends=('python-requests' 'python-bibtexparser' 'python-future')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibcure/doi2bib/archive/$pkgver.tar.gz")
sha256sums=('94857e12d71727bd9bfc9e4667a31c68b159ba1de60fb8a2adf0905baca2827a')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
