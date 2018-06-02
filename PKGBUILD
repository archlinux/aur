# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=title2bib
pkgver=0.3.0
pkgrel=1
pkgdesc="Generate a bibtex given a title"
url="https://github.com/bibcure/title2bib"
arch=('any')
license=('AGPL3')
depends=('python-requests' 'python-future' 'doi2bib' 'arxivcheck' 'python-unidecode')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibcure/title2bib/archive/$pkgver.tar.gz")
sha256sums=('13ef886aea31aa70d281531637dff4bb9b1ed5ff2bd29ef6b091ac5dedbd71c8')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
