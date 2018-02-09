# Maintainer: Samuele Santi <samuele+aur@samuelesanti.com>
pkgname=ttf-typopro
pkgver=3.4.9
pkgrel=1
pkgdesc="TypoPRO fonts from http://typopro.org/"
arch=('any')
license=('MIT' 'Apache' 'OFL' 'CC0')
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=("https://github.com/rse/typopro-web/archive/${pkgver}.zip")
sha256sums=('98ea13ad9ca6a1ac99bb6e9ebf6cba70f79c432b36ccff07563959aa6f4b3bb8')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 typopro-web-${pkgver}/web/*/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
