# Maintainer: sanlun <miwa at nc-toyama dot ac dot jp>

pkgname=cl-swap-bytes
_pkgname=${pkgname#cl-}
pkgver=1.2
pkgrel=1
pkgdesc='Efficient endianness conversion for Common Lisp'
arch=('any')
url='https://github.com/sionescu/swap-bytes'
license=('MIT')
depends=('common-lisp' 'cl-asdf' 'cl-trivial-features')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3a2328798ec0f58956f8c08bfe3426f5acf329c66c0225803b18ee75a9b030aa')


package(){
  cd "$_pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENCE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
  install -Dm644 -t "$pkgdir/usr/share/common-lisp/source/$_pkgname" *.{lisp,asd,sexp}
}
