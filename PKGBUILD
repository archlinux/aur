# Maintainer: Samuele Santi <samuele+aur@samuelesanti.com>
pkgname=ttf-typopro
pkgver=3.7.8
pkgrel=1
pkgdesc="TypoPRO fonts from http://typopro.org/"
arch=('any')
url="http://typopro.org/"
license=('MIT' 'Apache' 'OFL' 'CC0')
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=("https://github.com/rse/typopro-web/archive/${pkgver}.zip")
sha256sums=('0ddac4b0d27b957000c63b19dc052d1478ec7a92d094b3d549117dc508a36a44')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 typopro-web-${pkgver}/web/*/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
