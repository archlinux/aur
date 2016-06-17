# Maintainer: Yadieet SA <qts19bit@gmail.com>


pkgname=create-pcr-script
pkgver=1.39.4
pkgrel=1
pkgdesc="Bash script to create local repository from pacman cache (pacman cache repository)"
arch=('any')
url="https://github.com/yadieet/pcr"
license=('GPLv2')
depends=('bash')
source=("create-pcr-$pkgver::https://raw.githubusercontent.com/yadieet/pcr/cd1d2c7be2c365428eb609858d8db0aaca78793d/create-pcr")
md5sums=('0362be31398a836b6d7b1c9eee98cf74')


package() {
  install -D -m755 "${srcdir}/create-pcr-$pkgver" "${pkgdir}/usr/bin/create-pcr"
}

