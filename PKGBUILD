pkgname=aether-icons-git
_pkgname=aether-icons
pkgver=r
pkgrel=1
pkgdesc="Aether icon set inspired by Kirigami and Material Design"
arch=('any')
url="https://kver.wordpress.com/2017/04/29/aether-icon-theme/"
license=('CC BY-SA 3.0')
depends=('breeze-icons')
provides=("$_pkgname")
conflicts=("$_pkgname" "$pkgname")
source=("git://anongit.kde.org/scratch/kvermette/aether-icons.git")
sha256sums=('SKIP')

package() {
  msg2 "Installing "$pkgname"...";
  cd ${srcdir}/"$_pkgname"/"$_pkgname";
  install -dm 755 "$pkgdir"/usr/share/icons;
  cp -drf --no-preserve='ownership' . "$pkgdir"/usr/share/icons/"$_pkgname";
};
