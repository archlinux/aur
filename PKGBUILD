# Maintainer: Samuele Santi <samuele+aur@samuelesanti.com>
pkgname=ttf-typopro
pkgver=3.4.4
pkgrel=1
pkgdesc="TypoPRO fonts from http://typopro.org/"
arch=('any')
license=('MIT' 'Apache' 'OFL' 'CC0')
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=('https://github.com/rse/typopro-web/archive/3.4.4.zip')
sha256sums=('d64e34001bceda14868d5e1e021b77e55ee78451eef23db1506318df52e032fd')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 typopro-web-3.4.4/web/*/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
