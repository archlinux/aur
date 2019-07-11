# Maintainer: Andrej Radovic <r.andrej@gmail.com>

_basename=sqlfmt
pkgname=sqlfmt-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Experimental SQL formatter with width-aware output.'
arch=('x86_64')
url="https://github.com/mjibson/sqlfmt"
license=('APACHE')
source=(
  "$url/releases/download/v$pkgver/${_basename}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/mjibson/sqlfmt/v${pkgver}/LICENSE"
)

sha256sums=('df4d726e289c846761c9e1b54b1340e094e4e490b41002a60cf32e12db97693a'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  install -Dm755 $_basename -t "$pkgdir"/usr/bin/
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
