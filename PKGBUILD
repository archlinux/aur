# Maintainer: Yadieet SA <qts19bit@gmail.com>


pkgname=create-pcr-script
pkgver=1.40.0
pkgrel=1
pkgdesc="Bash script to create local repository from pacman cache (pacman cache repository)"
arch=('any')
url="https://github.com/yadieet/pcr"
license=('GPLv2')
depends=('bash')
source=("create-pcr-$pkgver::https://raw.githubusercontent.com/yadieet/pcr/b0bb56446f7f654aa57ce2e8333a6e4983d860ec/create-pcr")
md5sums=('9b631052af21ce833106e6ef8d6be9b9')


package() {
  install -D -m755 "${srcdir}/create-pcr-$pkgver" "${pkgdir}/usr/bin/create-pcr"
}

