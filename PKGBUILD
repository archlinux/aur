# Maintainer: sardach <sardach@uwu.mx>
pkgname=rae
_pkgname='rae-cli'
pkgver=0.12
pkgrel=1
pkgdesc="RAE dictionary on the terminal / El Diccionario de la Real Academia Española desde la terminal."
arch=('any')
url="https://github.com/sardach/rae-cli"
license=('GPL3')
depends=(elinks curl)
source=("git+https://github.com/sardach/rae-cli")
md5sums=('SKIP');
package() {
  install -Dm755 "$srcdir/rae-cli/rae" "${pkgdir}/usr/bin/rae"
}





