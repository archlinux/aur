# Maintainer: Yadieet SA <qts19bit@gmail.com>


pkgname=create-pcr-script
pkgver=1.39.1
pkgrel=1
pkgdesc="Bash script to create local repository from pacman cache. (Pacman Cache Repository)"
arch=('any')
url="https://github.com/yadieet/pcr"
license=('GPLv2')
depends=('bash')
source=("create-pcr-$pkgver::https://raw.github.com/yadieet/pcr/34b8fb15f1b9d38aae57559b923205846ff050eb/create-pcr")
md5sums=('5c3a9ecac307ffeee04578ff6cdb4427')


package() {
  install -D -m755 "${srcdir}/create-pcr-$pkgver" "${pkgdir}/usr/bin/create-pcr"
}

