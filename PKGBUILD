# Maintainer: Andrej Radovic <r.andrej@gmail.com>

_basename=sqlfmt
pkgname=sqlfmt-bin
pkgver=0.5.0
pkgrel=1
pkgdesc='Experimental SQL formatter with width-aware output.'
arch=('x86_64')
url="https://github.com/maddyblue/sqlfmt"
license=('APACHE')
source=(
  "$url/releases/download/v$pkgver/${_basename}_Linux_x86_64.tar.gz"
  "https://raw.githubusercontent.com/maddyblue/sqlfmt/v${pkgver}/LICENSE"
)

sha256sums=('3fe56335be7037b2d62103621be4e3d4106cbf6b39146f77528f8684fe05abce'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')

package() {
  install -Dm755 $_basename -t "$pkgdir"/usr/bin/
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
