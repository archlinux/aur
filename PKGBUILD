# Maintainer: sardach <sardach@uwu.mx>
pkgname=rae-cli
_pkgname='rae'
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
echo "#!/bin/bash
echo 'Use command rae instead of rae-cli // Usa el comando rae en lugar de rae-cli'" > $srcdir/rae-cli/rae-cli
  install -Dm755 "$srcdir/rae-cli/rae" "${pkgdir}/usr/bin/rae"
  install -Dm755 "$srcdir/rae-cli/rae-cli" "${pkgdir}/usr/bin/rae-cli"
}





