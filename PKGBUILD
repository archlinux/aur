# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Ramon Buldó <ramon@manjaro.org>
# Author: Krzysztof P. (donpedro69)
# http://kde-look.org/content/show.php?action=content&content=160955
# http://kde-look.org/content/show.php?action=content&content=143890
# Edited for use in Kde by tulliana (actions icons patch-0.4 included)
# Edited for use in Kde by FadeMind (merged faenza original pack and fixed some missing links)

pkgname=kdeicons-kfaenza
pkgver=0.8.11
pkgrel=1
pkgdesc="Faenza Icon Theme for KDE"
arch=('any')
url="http://kde-look.org/content/show.php?action=content&content=160955"
license=('GPL3')
conflicts=('kfaenza-icon-theme')
provides=('kfaenza-icon-theme')
source=("$pkgname-$pkgver.tar.gz::https://copy.com/X9JtbVJw9o1d/KFaenza.tar.gz?download=1")
md5sums=('fde139b08ba6116c3cfa011bc5c09fdb')

package() {
   install -dm755 $pkgdir/usr/share/icons
   cp -r $srcdir/KFaenza $pkgdir/usr/share/icons
   find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
   find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}
