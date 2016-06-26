# Maintainer: scan
pkgname=breeze-default-cursor-theme
pkgver=2.0
pkgrel=1
pkgdesc="Breeze Default Cursor Theme."
arch=('any')
url="https://www.gnome-look.org/p/999991"
license=('GPL')
source=("breeze_defaults.tgz::https://www.dropbox.com/s/euyzcwcs7zb4mb1/Breeze.tgz")
sha256sums=('b03fe99c13a2f136904833718bdc34950a2a31d9c7e907355b7be61f5a012d09')

package() {
    install -d $pkgdir/usr/share/icons
    cp -r Breeze $pkgdir/usr/share/icons/Breeze_Default
		find ${pkgdir} -type f -exec chmod 644 {} \;
		find ${pkgdir} -type d -exec chmod 755 {} \;
}
