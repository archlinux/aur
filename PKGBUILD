# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Greg White <gwhite@kupulau.com>
pkgname=capitaine-cursors-hidpi
pkgver=1
pkgrel=1
pkgdesc="An x-cursor theme inspired by macOS and based on KDE Breeze (HiDPI)"
arch=('any')
url="https://github.com/keeferrourke/capitaine-cursors"
license=('LGPL3')
source=("capitaine-cursors-hidpi-src.tar.gz::https://raw.githubusercontent.com/DebauchedSloth/capitaine-cursors/master/capitaine-cursors-hidpi-src.tar.gz")
md5sums=('9aa24dc5c5fa62e9c949383a066ce868')
sha256sums=('e96b2bd2c316f22fdf2825facd45d946c4cf90be79edc6d059601f6625e06fcb')

package() {
    install -d "${pkgdir}/usr/share/icons"
    cd usr/share/icons
	cp -r capitaine-cursors-hidpi "${pkgdir}/usr/share/icons"
    find ${pkgdir} -type f -exec chmod 644 {} \;
}
