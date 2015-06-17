# Maintainer: Yadieet SA <qts19bit@gmail.com>


pkgname=create-pcr-script
pkgver=1.39.2
pkgrel=1
pkgdesc="Bash script to create local repository from pacman cache (pacman cache repository)"
arch=('any')
url="https://github.com/yadieet/pcr"
license=('GPLv2')
depends=('bash')
source=("create-pcr-$pkgver::https://raw.githubusercontent.com/yadieet/pcr/2f08438fc180a120dee96fed585b2f1d02821151/create-pcr")
md5sums=('86c9bed54e5c64ddb275e96d6698693c')


package() {
  install -D -m755 "${srcdir}/create-pcr-$pkgver" "${pkgdir}/usr/bin/create-pcr"
}

