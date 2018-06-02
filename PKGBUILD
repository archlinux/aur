# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>

pkgname=bibcure
pkgver=0.3.0
pkgrel=1
pkgdesc="Helps you to have a better bibtex file"
url="https://github.com/bibcure/bibcure"
arch=('any')
license=('AGPL3')
depends=('python-bibtexparser' 'python-future' 'doi2bib' 'title2bib' 'arxivcheck')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibcure/bibcure/archive/$pkgver.tar.gz")
sha256sums=('b87a89ea2c1f7b414c41aba9f382da14cc2dfeb2a5b8c92e04625c745080bd81')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
