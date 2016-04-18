# Maintainer: Warlock9000

pkgname=cloak-gtk2-gtk3-theme
pkgver=3.20.2_04172016
pkgrel=2
pkgdesc="A clean dark theme for GTK3 / GTK2, Gnome-Shell-Theme, Metacity Theme"
arch=('any')
url="http://killhellokitty.deviantart.com/art/Cloak-3-20-2-04172016-603341133?q=gallery%3Akillhellokitty%2F26771632&qo=0"
license=('CC')
source=('http://orig06.deviantart.net/e6b8/f/2016/108/0/0/cloak_3_20_2_04172016_by_killhellokitty-d9z7ozx.zip')
md5sums=('027d39041ea2a6b1a132ef0269dd1809')
depends=('gtk-engine-murrine')
optdepends=('gnome-themes-standard: Default themes for the GNOME desktop' 'gnome-tweak-tool: A tool to customize advanced GNOME 3 options' 'gnome-shell-extension-user-theme: User Theme extension for GNOME Shell')

package() {
  cd "$srcdir"
  mkdir -p "${pkgdir}"/usr/share/themes
  cp -rf Cloak-3.20 "${pkgdir}"/usr/share/themes/
  chmod 644 -R "$pkgdir/usr/share/themes"
}