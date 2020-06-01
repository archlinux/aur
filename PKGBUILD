# Maintainer: Frank Zimmermann <veltheimer_frank at t-online.de>

pkgname=aerzte_sans
_pkgname=aerzte_sans
pkgver=1.0
pkgrel=1
pkgdesc="Ärzte Sans Open Type Font"
depends=('fontconfig')
arch=('any')
url="https://www.bademeister.com"
license=('CC BY-NC-SA 3.0 DE')
noextract=(${source[@]##*/})
source=(https://downloads.bademeister.com/bonus/ArzteSans_OTF_1.0.zip)

md5sums=('161eba42745cc77ed14c87a9313fd34b')

package() {
  install -d "${pkgdir}/usr/share/fonts/${pkgname}"
  cp -dpr --no-preserve=all "${srcdir}/ArzteSans_OTF_1.0/"*.otf "${pkgdir}/usr/share/fonts/${pkgname}"
}
