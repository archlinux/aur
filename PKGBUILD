# Maintainer: Max Gonzih <gonzih at gmail dot com>
pkgname=iosevka-font
pkgver=0.0.3
pkgrel=1
pkgdesc="Iosevka programming font"
arch=('any')
url=('https://github.com/be5invis/Iosevka')
license=('SIL')
depends=(fontconfig xorg-font-utils )
install=$pkgname.install
source=('https://github.com/be5invis/Iosevka/archive/v0.0.3.zip')
md5sums=('13d4e8fefda3223a5e6a880b57dd0b8a')

package() {
  cd $srcdir/
  find . -iname "*.ttf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
  # find . -iname "*.otf" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
  # find . -iname "*.pcf.gz" -execdir install -Dm644 {} $pkgdir/usr/share/fonts/misc/{} \;
  # find . -iname "*.psf.gz" -execdir install -Dm644 {} $pkgdir/usr/share/kbd/consolefonts/{} \;
}
