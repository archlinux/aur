# Maintainer: sanlun <miwa at nc hyphen toyama dot ac dot jp>

pkgname=cl-idna
_pkgname=${pkgname#cl-}
pkgver=0.2.2
pkgrel=1
pkgdesc='Common Lisp IDNA encding / decoding functions'
arch=('any')
url='https://github.com/antifuchs/idna'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-split-sequence')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b5efbdcf9d11ac4ccefe8f4eba24ae6cbedece2256a381d91cb2d104d3b73535')

package(){
  cd "$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" *.{lisp,asd}
}
