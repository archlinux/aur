# Contributor: Twa022 <twa022@gmail.com>

pkgname=gtk-newwave-greymod-darkmenus-theme
pkgver=1.0.1
pkgrel=1
pkgdesc="The New Wave theme, minus the ubuntu orange, with dark menus"
url="http://gnome-look.org/content/show.php?content=106970"
arch=('any')
license=('CreativeCommons')
depends=('gtk-engines')
source=("http://gnome-look.org/CONTENT/content-files/106970-NewWave-GreyMOD-DarkMenus.tar.bz2")
md5sums=('d00a532168eb9986d895c22af46e35ec')

build() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/share/themes
  cp -r NewWave-GreyMOD-DarkMenus ${pkgdir}/usr/share/themes  
}
