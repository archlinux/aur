# Maintainer: Glaciuse <glaciuse@gmail.com>
# Contributor: FadeMind <fademind@gmail.com>
# Author: Krzysztof P. (donpedro69)
# Edited for use in Kde by tulliana (actions icons patch-0.4 included)
# Edited for use in Kde by FadeMind (merged faenza original pack and fixed some missing links)
# Edited for use in kde with dark themes by Glaciuse (black icons are replaced with white icons)


pkgname=kfaenza-dark-themes
pkgver=0.8.11
pkgrel=1
pkgdesc="Faenza Icon Theme for KDE with dark desktop themes"
arch=('any')
url="https://copy.com/wgjfNFOsfDMjTVxZ/KFaenza-dark-themes.tar.gz"
license=('GPL3')
optdepends=('oxygen-icons: Parent theme for not implemented icons'
            'faenza-icon-theme: Parent theme for not implemented icons'
            'hicolor-icon-theme: Parent theme for not implemented icons')
conflicts=()
provides=('kfaenza-dark-themes')
source=("$pkgname-$pkgver.tar.gz::https://copy.com/wgjfNFOsfDMjTVxZ/KFaenza-dark-themes.tar.gz?download=1")
md5sums=('c5b345e4655379299688109f568c919a')

package() {
   install -dm755 $pkgdir/usr/share/icons
   cp -r $srcdir/KFaenza-dark-themes $pkgdir/usr/share/icons
   find "${pkgdir}/usr/share/icons" -type d -exec chmod 755 '{}' \;
   find "${pkgdir}/usr/share/icons" -type f -exec chmod 644 '{}' \;
}
 
