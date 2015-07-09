# Maintainer: sh4nks <https://github.com/sh4nks/pkgbuilds>
# Author: KEIII <gnome-look.org>
pkgname=adwaita-x-dark-and-light-theme
pkgver=1.3
pkgrel=1
pkgdesc="Adwaita-X dark and light theme pack (GTK3, GTK2, Mutter, Metacity, Xfwm4)"
arch=('any')
url="http://gnome-look.org/content/show.php?action=content&content=150905"
license=('GPL')
depends=('gtk-engine-murrine' 'gtk-engines' 'gnome-themes-standard')
optdepends=('ttf-droid: General-purpose fonts released by Google as part of Android')
source=("http://gnome-look.org/CONTENT/content-files/150905-adwaita-x-dark-light-$pkgver.zip")
md5sums=('5ced0d4ec96f254f6e190b0587206330')

package() {
    cd $srcdir
    for i in Adwaita-X*; do
        find "$i" -type f -not -name *~ -exec install -Dm644 '{}' "$pkgdir/usr/share/themes/{}" \;
    done
}
