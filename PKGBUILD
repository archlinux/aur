# Maintainer: Andrej Radovic <r.andrej@gmail.com>

_basename=sqlfmt
pkgname=sqlfmt-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Experimental SQL formatter with width-aware output.'
arch=('x86_64')
url="https://github.com/mjibson/sqlfmt"
license=('APACHE')
source=(
  "$url/releases/download/v$pkgver/${_basename}_${pkgver}_linux_amd64.tar.gz"
  "https://raw.githubusercontent.com/mjibson/sqlfmt/v${pkgver}/LICENSE"
)

sha256sums=('37c4cd09af360b09604dc42e272012428eab4a6544653ef4ca6e0a0b7802ab26'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  install -Dm755 $_basename -t "$pkgdir"/usr/bin/
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
