# Maintainer: William Di Luigi <williamdiluigi@gmail.com>

pkgname=eplot
pkgver=2.07
pkgrel=1
pkgdesc="eplot (\"easy gnuplot\") is a ruby script which allows to pipe data easily through gnuplot and create plots quickly, which can be saved in postscript, PDF, PNG or EMF files"
arch=("any")
url="http://liris.cnrs.fr/christian.wolf/software/eplot/"
license=("GPL2")
depends=("ruby")

source=(
  "http://liris.cnrs.fr/christian.wolf/software/eplot/download/eplot"
  "http://liris.cnrs.fr/christian.wolf/software/eplot/download/ec"
)
sha256sums=(
  "855316d98db1f4abf8eae1dab3fa3ef09aa6a2c98270f1b1eeef3a3da2403d79"
  "0d7a309477f16aeaa2623a96f253b044a4b65848c031990524a1b35cd10be339"
)

package() {
  install -D -m755 eplot $pkgdir/usr/bin/eplot
  install -D -m755 ec $pkgdir/usr/bin/ec
}
