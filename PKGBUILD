# Maintainer: Federico Shestenge <fshestenge@gmail.com>

pkgname=murgafetch
pkgver=1.0
pkgrel=1
pkgdesc="The best f*cking fetch ever"
arch=('any')
url="https://github.com/f3d31206/murgafetch"
license=('GPL3')
depends=('bash')
source=("murgafetch::https://github.com/f3d31206/murgafetch/raw/master/Documentos/murgafetch")
md5sums=('SKIP')

package() {
  install -Dm755 "$srcdir/murgafetch" "$pkgdir/usr/bin/murgafetch"
}
