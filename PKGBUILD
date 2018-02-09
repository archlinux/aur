# Maintainer: Samuele Santi <samuele+aur@samuelesanti.com>
pkgname=ttf-typopro
pkgver=3.7.6
pkgrel=1
pkgdesc="TypoPRO fonts from http://typopro.org/"
arch=('any')
license=('MIT' 'Apache' 'OFL' 'CC0')
depends=(fontconfig xorg-font-utils)
install=$pkgname.install
source=("https://github.com/rse/typopro-web/archive/${pkgver}.zip")
sha256sums=('d97ebe94244c391f9c9384abc03d66669bad8d73867c4e7d0e5518c6bef88f01')

package() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/fonts/TTF/
  install -m644 typopro-web-${pkgver}/web/*/*.ttf ${pkgdir}/usr/share/fonts/TTF/
}
