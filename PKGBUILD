# Maintainer: Fabio Zanini <fabio _DOT zanini AT_ fastmail DOT_ fm>
pkgname=python-htseq
pkgver=0.7.2
pkgrel=1
pkgdesc='framework to process and analyze data from high-throughput sequencing assays'
arch=('i686' 'x86_64')
url="https://github.com/simon-anders/htseq"
license=('GPL')
depends=('python-matplotlib')
source=("https://pypi.python.org/packages/46/f7/6105848893b1d280692eac4f4f3c08ed7f424cec636aeda66b50bbcf217e/HTSeq-${pkgver}.tar.gz")
md5sums=('8ddaaf53e83547fbca3bba7b84c9dde8')
options=('!emptydirs')

package() {
  cd "$srcdir/HTSeq-${pkgver}"

  python setup.py install --root="$pkgdir/" --optimize=1
}
