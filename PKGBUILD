# Maintainer: Fabio Zanini <fabio _DOT zanini AT_ fastmail DOT_ fm>
pkgname=python-htseq
pkgver=0.8.0
pkgrel=1
pkgdesc='framework to process and analyze data from high-throughput sequencing assays'
arch=('i686' 'x86_64')
url="https://github.com/simon-anders/htseq"
license=('GPL')
depends=('python-matplotlib')
source=("https://pypi.python.org/packages/de/e4/5287587097a4c46b571babb074ce3ff91cf220bed26502b69dccd3a2fda3/HTSeq-0.8.0.tar.gz")
md5sums=('0a62f5da8905ad206389c29afd724afd')
options=('!emptydirs')

package() {
  cd "$srcdir/HTSeq-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}
