#Maintainer Marco Pompili <marcs.pompili@gmail.com>

pkgname=evolvere-icons
pkgver=1.1.9.1
pkgrel=1
pkgdesc="Evolvere Suit is an advanced theme for KDE, Gnome, Mate."
arch=("any")
url="http://gnome-look.org/content/show.php/Evolvere+Icon+theme?content=164338"
makedepends=("git")
source=("git+https://github.com/franksouza183/EvolvereSuit.git")
md5sums=("SKIP")
options=("!strip")

package() {
  mkdir -p ${pkgdir}/usr/share/icons/

  cd $srcdir/EvolvereSuit/icons

  cp -r * ${pkgdir}/usr/share/icons/
}
