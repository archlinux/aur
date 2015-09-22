# Maintainer: Peter Hoeg <first name at last name dot com>

pkgname=ttf-fontawesome
pkgver=4.4.0
pkgrel=1
pkgdesc="Font Awesome icon set"
arch=('any')
license=('SIL Open Font License 1.1 and MIT')
url="http://fontawesome.github.io/"
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=ttf.install
source=("https://fortawesome.github.io/Font-Awesome/assets/font-awesome-${pkgver}.zip")
sha256sums=('715c97f01478a4853532b371547252d59f6ad293f97b22b1cd585c76c371eecc')

package() {
  install -Dm644 -t $pkgdir/usr/share/fonts/TTF \
    $srcdir/font-awesome-${pkgver}/fonts/*.ttf
}
