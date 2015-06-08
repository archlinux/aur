# Maintainer: Sapphira Armageddos <shadowkyogre.public+aur@gmail.com>

pkgname=gtk-theme-anewstart-blood
pkgver=1.0
pkgrel=2
pkgdesc="A slick and clear GTK2/GTK3 theme, colored to dark grey and red"
arch=('any')
url="http://alecive.deviantart.com/art/A-New-Start-1-3-169100684"
license=('cc-by-nc-sa')
optdepends=('gtk-engine-unico: for the GTK3 theme' 'gtk-engine-murrine: for the GTK2 theme')
source=('http://fc03.deviantart.net/fs71/f/2011/354/8/b/anewstartblood___1_0_by_alecive-d4j2r5l.zip')

package() {
  cd ANewStartBlood/1*

  find ANewStartBlood/ -type f -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
}
md5sums=('cd1d486a5e4c14cad3d1c2d25f75a1be')
