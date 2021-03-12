# Maintainer: Romanos 'rski' Skiadas <rom skiad at gmail dot com>
# Contributor: demonicmaniac < namida1@gmx.net >

pkgname=ttf-manaspace
pkgver=1
pkgrel=4
pkgdesc="Secret of Mana Font converted to TTF"
arch=('any')
url="https://www.zone38.net/font/"
license=('custom')
source=(https://www.zone38.net/font/manaspc_ger.zip)
md5sums=('f9f00e48dce0cf5a8fae97654d8a0419')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/TTF
  install *.ttf ${pkgdir}/usr/share/fonts/TTF

}


