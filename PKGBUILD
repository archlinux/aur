# Maintainer: Erik Dubois <erik.dubois@gmail.com>
pkgname=sardi-icons
pkgver=5.1
pkgrel=2
pkgdesc="Sardi is an icon theme build upon ardis icons but has outgrown its roots > 18 iconsets"
arch=('any')
url="http://sourceforge.net/projects/sardi"
license=('Attribution-NonCommercial-ShareAlike 4.0 International Public License')
provides=('sardi-icons')
options=(!strip !emptydirs)
source=("http://downloads.sourceforge.net/project/sardi/${pkgname}-${pkgver}-${pkgrel}.tar.gz")
sha256sums=('SKIP')

package() {
#cd src/${pkgname}-${pkgver}-${pkgrel}


  install -dm 755 "${pkgdir}"/usr/share/icons
  cp -dr --no-preserve='ownership' Sardi "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Faenza\ Black "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Flat "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Flat\ Black "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Flat\ Majestic "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Flat\ Orange "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Flexible "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Ghost "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Ghost\ Flexible "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Grey "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Mono "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Mono\ Mint-X-Grey "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Mono\ Numix "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Mono\ Numix\ Grey "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Mono\ Orange "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Mono\ Vertexed "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Orange "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Red "${pkgdir}"/usr/share/icons/
  cp -dr --no-preserve='ownership' Sardi\ Vertexed "${pkgdir}"/usr/share/icons/
  
}

