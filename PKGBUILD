# Maintainer: Yadieet SA <qts19bit@gmail.com>


pkgname=create-pcr-script
pkgver=1.39.3
pkgrel=1
pkgdesc="Bash script to create local repository from pacman cache (pacman cache repository)"
arch=('any')
url="https://github.com/yadieet/pcr"
license=('GPLv2')
depends=('bash')
source=("create-pcr-$pkgver::https://raw.githubusercontent.com/yadieet/pcr/4ff92a0376ea2688c41542262c21484deedb6ebe/create-pcr")
md5sums=('a8a5c60a1c919d9513d5bbacaea1a7de')


package() {
  install -D -m755 "${srcdir}/create-pcr-$pkgver" "${pkgdir}/usr/bin/create-pcr"
}

