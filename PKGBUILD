# Maintainer: Excitable Snowball <excitablesnowball@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=arxivcheck
pkgver=0.3.1
pkgrel=3
pkgdesc="Generate a bibtex given a arxiv id or title, check if published"
url="https://github.com/bibcure/arxivcheck"
arch=('any')
license=('AGPL3')
depends=('python2-future' 'python2-unidecode' 'python2-feedparser' 'python2-bibtexparser' 'doi2bib')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bibcure/arxivcheck/archive/$pkgver.tar.gz")
sha256sums=('ce833cdbc6e3145180167e43462757453150bd2eaafe62c00f4a6349c0716837')

package() {
  cd $pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
