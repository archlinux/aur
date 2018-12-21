# Maintainer: Andrej Radovic <r.andrej@gmail.com>

_basename=sqlfmt
pkgname=sqlfmt-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Experimental SQL formatter with width-aware output.'
arch=('x86_64')
url="https://github.com/mjibson/sqlfmt"
license=('APACHE')
source=(
  "$url/releases/download/v$pkgver/${_basename}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/mjibson/sqlfmt/v${pkgver}/LICENSE"
)

sha256sums=('820ab91550736e658c3af734d30ba8342120561f3a8f4ea211d8d6bd463a23c8'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  install -Dm755 $_basename -t "$pkgdir"/usr/bin/
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
