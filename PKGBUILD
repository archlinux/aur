# Maintainer: Hugo Osvaldo Barrera <hugo@osvaldobarrera.com.ar>

pkgname=ttf-tempesta-seven
pkgver=1.2
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Tempesta seven font pack."
arch=('any')
url="http://p.yusukekamiyamane.com/"
license="Unknown"
source=(${pkgname}.zip::http://p.yusukekamiyamane.com/fonts/downloads/tempesta-seven-fonts-${pkgver}.zip)
md5sums=('cc4a722fae8fac219e3159db1745fc7c')
install=$pkgname.install

package() {
  find . -name "*.ttf" -exec install -Dm 644 {} "$pkgdir/usr/share/fonts/TTF/{}" \;
}
