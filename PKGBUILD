# Maintainer: aksr <aksr at t-com dot me>
_pkgname=churchslavonic
pkgname=otf-${_pkgname}
pkgver=1.1
pkgrel=1
pkgdesc="Unicode-encoded OpenType fonts for Church Slavonic"
arch=('any')
license=('SIL' 'GNUv3')
url="https://github.com/typiconman/fonts-cu/"
url="https://www.ctan.org/pkg/fonts-churchslavonic"
install=otf.install
source=("http://mirrors.ctan.org/fonts/fonts-${_pkgname}.zip")
md5sums=('b2bc9635b2e161f0b0d782caadb8bcd5')
sha1sums=('200ba0e2118b36a01709f52be02b619fec83b31a')
sha256sums=('3395d6005509b84c1e98182928ae35561cf6d3a94bb2be5b77f842e5de52bedb')

package() {
  cd "$srcdir/fonts-${_pkgname}"
  mkdir -p $pkgdir/usr/share/{fonts/OTF,licenses/$pkgname}/
  install -Dm644 *.otf $pkgdir/usr/share/fonts/OTF/
  install -Dm644 fonts-churchslavonic.pdf $pkgdir/usr/share/doc/$pkgname/fonts-churchslavonic.pdf
  install -Dm644 *.txt LICENSE $pkgdir/usr/share/licenses/$pkgname/
}

