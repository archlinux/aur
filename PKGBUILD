# Maintainer: Federico Shestenge <fshestenge@gmail.com>


pkgname=murgafetch
pkgver=1.0
pkgrel=1
pkgdesc="The best f*cking fetch ever"
arch=('any')
url="https://github.com/f3d31206/murgafetch"  # O tu web personal
license=('GPL3')  # O lo que corresponda
depends=('bash')  # Dependencias necesarias
source=("https://github.com/f3d31206/murgafetch/raw/main/murgafetch")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/murgafetch" "$pkgdir/usr/bin/murgafetch"
}
