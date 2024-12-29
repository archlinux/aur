# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=title2bib
pkgver=0.4.1
pkgrel=2
pkgdesc="Generate a bibtex given a title"
url="https://github.com/bibcure/title2bib"
arch=('any')
license=('AGPL3')
depends=('python-requests' 'doi2bib' 'arxivcheck' 'python-unidecode' 'python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibcure/title2bib/archive/$pkgver.tar.gz")
sha256sums=('9a9be67f50e283d95f1c9018d2211f6e2c532249723c955babdbdcc948b20f66')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
